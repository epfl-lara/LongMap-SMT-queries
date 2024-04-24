; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82304 () Bool)

(assert start!82304)

(declare-fun b!958286 () Bool)

(declare-fun e!540221 () Bool)

(declare-fun tp_is_empty!21115 () Bool)

(assert (=> b!958286 (= e!540221 tp_is_empty!21115)))

(declare-fun b!958287 () Bool)

(declare-fun e!540222 () Bool)

(assert (=> b!958287 (= e!540222 false)))

(declare-fun lt!430675 () Bool)

(declare-datatypes ((array!58370 0))(
  ( (array!58371 (arr!28054 (Array (_ BitVec 32) (_ BitVec 64))) (size!28534 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58370)

(declare-datatypes ((List!19504 0))(
  ( (Nil!19501) (Cons!19500 (h!20668 (_ BitVec 64)) (t!27859 List!19504)) )
))
(declare-fun arrayNoDuplicates!0 (array!58370 (_ BitVec 32) List!19504) Bool)

(assert (=> b!958287 (= lt!430675 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19501))))

(declare-fun b!958288 () Bool)

(declare-fun res!641246 () Bool)

(assert (=> b!958288 (=> (not res!641246) (not e!540222))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58370 (_ BitVec 32)) Bool)

(assert (=> b!958288 (= res!641246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958289 () Bool)

(declare-fun e!540219 () Bool)

(assert (=> b!958289 (= e!540219 tp_is_empty!21115)))

(declare-fun mapIsEmpty!33652 () Bool)

(declare-fun mapRes!33652 () Bool)

(assert (=> mapIsEmpty!33652 mapRes!33652))

(declare-fun b!958290 () Bool)

(declare-fun res!641248 () Bool)

(assert (=> b!958290 (=> (not res!641248) (not e!540222))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33137 0))(
  ( (V!33138 (val!10608 Int)) )
))
(declare-datatypes ((ValueCell!10076 0))(
  ( (ValueCellFull!10076 (v!13162 V!33137)) (EmptyCell!10076) )
))
(declare-datatypes ((array!58372 0))(
  ( (array!58373 (arr!28055 (Array (_ BitVec 32) ValueCell!10076)) (size!28535 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58372)

(assert (=> b!958290 (= res!641248 (and (= (size!28535 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28534 _keys!1668) (size!28535 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958291 () Bool)

(declare-fun e!540220 () Bool)

(assert (=> b!958291 (= e!540220 (and e!540219 mapRes!33652))))

(declare-fun condMapEmpty!33652 () Bool)

(declare-fun mapDefault!33652 () ValueCell!10076)

(assert (=> b!958291 (= condMapEmpty!33652 (= (arr!28055 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10076)) mapDefault!33652)))))

(declare-fun res!641247 () Bool)

(assert (=> start!82304 (=> (not res!641247) (not e!540222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82304 (= res!641247 (validMask!0 mask!2088))))

(assert (=> start!82304 e!540222))

(assert (=> start!82304 true))

(declare-fun array_inv!21835 (array!58372) Bool)

(assert (=> start!82304 (and (array_inv!21835 _values!1386) e!540220)))

(declare-fun array_inv!21836 (array!58370) Bool)

(assert (=> start!82304 (array_inv!21836 _keys!1668)))

(declare-fun mapNonEmpty!33652 () Bool)

(declare-fun tp!64258 () Bool)

(assert (=> mapNonEmpty!33652 (= mapRes!33652 (and tp!64258 e!540221))))

(declare-fun mapValue!33652 () ValueCell!10076)

(declare-fun mapRest!33652 () (Array (_ BitVec 32) ValueCell!10076))

(declare-fun mapKey!33652 () (_ BitVec 32))

(assert (=> mapNonEmpty!33652 (= (arr!28055 _values!1386) (store mapRest!33652 mapKey!33652 mapValue!33652))))

(assert (= (and start!82304 res!641247) b!958290))

(assert (= (and b!958290 res!641248) b!958288))

(assert (= (and b!958288 res!641246) b!958287))

(assert (= (and b!958291 condMapEmpty!33652) mapIsEmpty!33652))

(assert (= (and b!958291 (not condMapEmpty!33652)) mapNonEmpty!33652))

(get-info :version)

(assert (= (and mapNonEmpty!33652 ((_ is ValueCellFull!10076) mapValue!33652)) b!958286))

(assert (= (and b!958291 ((_ is ValueCellFull!10076) mapDefault!33652)) b!958289))

(assert (= start!82304 b!958291))

(declare-fun m!889671 () Bool)

(assert (=> b!958287 m!889671))

(declare-fun m!889673 () Bool)

(assert (=> b!958288 m!889673))

(declare-fun m!889675 () Bool)

(assert (=> start!82304 m!889675))

(declare-fun m!889677 () Bool)

(assert (=> start!82304 m!889677))

(declare-fun m!889679 () Bool)

(assert (=> start!82304 m!889679))

(declare-fun m!889681 () Bool)

(assert (=> mapNonEmpty!33652 m!889681))

(check-sat tp_is_empty!21115 (not b!958287) (not b!958288) (not mapNonEmpty!33652) (not start!82304))
(check-sat)
