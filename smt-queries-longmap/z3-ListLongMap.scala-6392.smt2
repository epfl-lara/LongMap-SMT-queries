; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82130 () Bool)

(assert start!82130)

(declare-fun b!957252 () Bool)

(declare-fun res!640848 () Bool)

(declare-fun e!539579 () Bool)

(assert (=> b!957252 (=> (not res!640848) (not e!539579))))

(declare-datatypes ((array!58300 0))(
  ( (array!58301 (arr!28024 (Array (_ BitVec 32) (_ BitVec 64))) (size!28505 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58300)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58300 (_ BitVec 32)) Bool)

(assert (=> b!957252 (= res!640848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957253 () Bool)

(assert (=> b!957253 (= e!539579 false)))

(declare-fun lt!430096 () Bool)

(declare-datatypes ((List!19524 0))(
  ( (Nil!19521) (Cons!19520 (h!20682 (_ BitVec 64)) (t!27878 List!19524)) )
))
(declare-fun arrayNoDuplicates!0 (array!58300 (_ BitVec 32) List!19524) Bool)

(assert (=> b!957253 (= lt!430096 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19521))))

(declare-fun b!957254 () Bool)

(declare-fun e!539578 () Bool)

(declare-fun tp_is_empty!21127 () Bool)

(assert (=> b!957254 (= e!539578 tp_is_empty!21127)))

(declare-fun b!957255 () Bool)

(declare-fun e!539581 () Bool)

(declare-fun e!539580 () Bool)

(declare-fun mapRes!33670 () Bool)

(assert (=> b!957255 (= e!539581 (and e!539580 mapRes!33670))))

(declare-fun condMapEmpty!33670 () Bool)

(declare-datatypes ((V!33153 0))(
  ( (V!33154 (val!10614 Int)) )
))
(declare-datatypes ((ValueCell!10082 0))(
  ( (ValueCellFull!10082 (v!13170 V!33153)) (EmptyCell!10082) )
))
(declare-datatypes ((array!58302 0))(
  ( (array!58303 (arr!28025 (Array (_ BitVec 32) ValueCell!10082)) (size!28506 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58302)

(declare-fun mapDefault!33670 () ValueCell!10082)

(assert (=> b!957255 (= condMapEmpty!33670 (= (arr!28025 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10082)) mapDefault!33670)))))

(declare-fun b!957256 () Bool)

(assert (=> b!957256 (= e!539580 tp_is_empty!21127)))

(declare-fun mapIsEmpty!33670 () Bool)

(assert (=> mapIsEmpty!33670 mapRes!33670))

(declare-fun res!640847 () Bool)

(assert (=> start!82130 (=> (not res!640847) (not e!539579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82130 (= res!640847 (validMask!0 mask!2088))))

(assert (=> start!82130 e!539579))

(assert (=> start!82130 true))

(declare-fun array_inv!21805 (array!58302) Bool)

(assert (=> start!82130 (and (array_inv!21805 _values!1386) e!539581)))

(declare-fun array_inv!21806 (array!58300) Bool)

(assert (=> start!82130 (array_inv!21806 _keys!1668)))

(declare-fun b!957257 () Bool)

(declare-fun res!640846 () Bool)

(assert (=> b!957257 (=> (not res!640846) (not e!539579))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957257 (= res!640846 (and (= (size!28506 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28505 _keys!1668) (size!28506 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33670 () Bool)

(declare-fun tp!64276 () Bool)

(assert (=> mapNonEmpty!33670 (= mapRes!33670 (and tp!64276 e!539578))))

(declare-fun mapRest!33670 () (Array (_ BitVec 32) ValueCell!10082))

(declare-fun mapKey!33670 () (_ BitVec 32))

(declare-fun mapValue!33670 () ValueCell!10082)

(assert (=> mapNonEmpty!33670 (= (arr!28025 _values!1386) (store mapRest!33670 mapKey!33670 mapValue!33670))))

(assert (= (and start!82130 res!640847) b!957257))

(assert (= (and b!957257 res!640846) b!957252))

(assert (= (and b!957252 res!640848) b!957253))

(assert (= (and b!957255 condMapEmpty!33670) mapIsEmpty!33670))

(assert (= (and b!957255 (not condMapEmpty!33670)) mapNonEmpty!33670))

(get-info :version)

(assert (= (and mapNonEmpty!33670 ((_ is ValueCellFull!10082) mapValue!33670)) b!957254))

(assert (= (and b!957255 ((_ is ValueCellFull!10082) mapDefault!33670)) b!957256))

(assert (= start!82130 b!957255))

(declare-fun m!887691 () Bool)

(assert (=> b!957252 m!887691))

(declare-fun m!887693 () Bool)

(assert (=> b!957253 m!887693))

(declare-fun m!887695 () Bool)

(assert (=> start!82130 m!887695))

(declare-fun m!887697 () Bool)

(assert (=> start!82130 m!887697))

(declare-fun m!887699 () Bool)

(assert (=> start!82130 m!887699))

(declare-fun m!887701 () Bool)

(assert (=> mapNonEmpty!33670 m!887701))

(check-sat (not b!957253) (not b!957252) tp_is_empty!21127 (not start!82130) (not mapNonEmpty!33670))
(check-sat)
