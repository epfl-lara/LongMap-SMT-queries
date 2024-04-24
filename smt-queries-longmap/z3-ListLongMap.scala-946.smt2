; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20776 () Bool)

(assert start!20776)

(declare-fun mapNonEmpty!8999 () Bool)

(declare-fun mapRes!8999 () Bool)

(declare-fun tp!19322 () Bool)

(declare-fun e!135770 () Bool)

(assert (=> mapNonEmpty!8999 (= mapRes!8999 (and tp!19322 e!135770))))

(declare-datatypes ((V!6697 0))(
  ( (V!6698 (val!2688 Int)) )
))
(declare-datatypes ((ValueCell!2300 0))(
  ( (ValueCellFull!2300 (v!4659 V!6697)) (EmptyCell!2300) )
))
(declare-fun mapValue!8999 () ValueCell!2300)

(declare-fun mapKey!8999 () (_ BitVec 32))

(declare-fun mapRest!8999 () (Array (_ BitVec 32) ValueCell!2300))

(declare-datatypes ((array!9775 0))(
  ( (array!9776 (arr!4638 (Array (_ BitVec 32) ValueCell!2300)) (size!4963 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9775)

(assert (=> mapNonEmpty!8999 (= (arr!4638 _values!649) (store mapRest!8999 mapKey!8999 mapValue!8999))))

(declare-fun mapIsEmpty!8999 () Bool)

(assert (=> mapIsEmpty!8999 mapRes!8999))

(declare-fun b!208116 () Bool)

(declare-fun res!101166 () Bool)

(declare-fun e!135771 () Bool)

(assert (=> b!208116 (=> (not res!101166) (not e!135771))))

(declare-datatypes ((array!9777 0))(
  ( (array!9778 (arr!4639 (Array (_ BitVec 32) (_ BitVec 64))) (size!4964 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9777)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208116 (= res!101166 (and (= (size!4963 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4964 _keys!825) (size!4963 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208117 () Bool)

(declare-fun res!101165 () Bool)

(assert (=> b!208117 (=> (not res!101165) (not e!135771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9777 (_ BitVec 32)) Bool)

(assert (=> b!208117 (= res!101165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208118 () Bool)

(assert (=> b!208118 (= e!135771 false)))

(declare-fun lt!106781 () Bool)

(declare-datatypes ((List!2908 0))(
  ( (Nil!2905) (Cons!2904 (h!3546 (_ BitVec 64)) (t!7831 List!2908)) )
))
(declare-fun arrayNoDuplicates!0 (array!9777 (_ BitVec 32) List!2908) Bool)

(assert (=> b!208118 (= lt!106781 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2905))))

(declare-fun b!208115 () Bool)

(declare-fun tp_is_empty!5287 () Bool)

(assert (=> b!208115 (= e!135770 tp_is_empty!5287)))

(declare-fun res!101167 () Bool)

(assert (=> start!20776 (=> (not res!101167) (not e!135771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20776 (= res!101167 (validMask!0 mask!1149))))

(assert (=> start!20776 e!135771))

(assert (=> start!20776 true))

(declare-fun e!135769 () Bool)

(declare-fun array_inv!3041 (array!9775) Bool)

(assert (=> start!20776 (and (array_inv!3041 _values!649) e!135769)))

(declare-fun array_inv!3042 (array!9777) Bool)

(assert (=> start!20776 (array_inv!3042 _keys!825)))

(declare-fun b!208119 () Bool)

(declare-fun e!135772 () Bool)

(assert (=> b!208119 (= e!135769 (and e!135772 mapRes!8999))))

(declare-fun condMapEmpty!8999 () Bool)

(declare-fun mapDefault!8999 () ValueCell!2300)

(assert (=> b!208119 (= condMapEmpty!8999 (= (arr!4638 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2300)) mapDefault!8999)))))

(declare-fun b!208120 () Bool)

(assert (=> b!208120 (= e!135772 tp_is_empty!5287)))

(assert (= (and start!20776 res!101167) b!208116))

(assert (= (and b!208116 res!101166) b!208117))

(assert (= (and b!208117 res!101165) b!208118))

(assert (= (and b!208119 condMapEmpty!8999) mapIsEmpty!8999))

(assert (= (and b!208119 (not condMapEmpty!8999)) mapNonEmpty!8999))

(get-info :version)

(assert (= (and mapNonEmpty!8999 ((_ is ValueCellFull!2300) mapValue!8999)) b!208115))

(assert (= (and b!208119 ((_ is ValueCellFull!2300) mapDefault!8999)) b!208120))

(assert (= start!20776 b!208119))

(declare-fun m!236001 () Bool)

(assert (=> mapNonEmpty!8999 m!236001))

(declare-fun m!236003 () Bool)

(assert (=> b!208117 m!236003))

(declare-fun m!236005 () Bool)

(assert (=> b!208118 m!236005))

(declare-fun m!236007 () Bool)

(assert (=> start!20776 m!236007))

(declare-fun m!236009 () Bool)

(assert (=> start!20776 m!236009))

(declare-fun m!236011 () Bool)

(assert (=> start!20776 m!236011))

(check-sat tp_is_empty!5287 (not b!208118) (not mapNonEmpty!8999) (not b!208117) (not start!20776))
(check-sat)
