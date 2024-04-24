; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108240 () Bool)

(assert start!108240)

(declare-fun res!848485 () Bool)

(declare-fun e!729271 () Bool)

(assert (=> start!108240 (=> (not res!848485) (not e!729271))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108240 (= res!848485 (validMask!0 mask!1805))))

(assert (=> start!108240 e!729271))

(assert (=> start!108240 true))

(declare-datatypes ((V!49489 0))(
  ( (V!49490 (val!16719 Int)) )
))
(declare-datatypes ((ValueCell!15746 0))(
  ( (ValueCellFull!15746 (v!19311 V!49489)) (EmptyCell!15746) )
))
(declare-datatypes ((array!83703 0))(
  ( (array!83704 (arr!40359 (Array (_ BitVec 32) ValueCell!15746)) (size!40910 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83703)

(declare-fun e!729270 () Bool)

(declare-fun array_inv!30865 (array!83703) Bool)

(assert (=> start!108240 (and (array_inv!30865 _values!1187) e!729270)))

(declare-datatypes ((array!83705 0))(
  ( (array!83706 (arr!40360 (Array (_ BitVec 32) (_ BitVec 64))) (size!40911 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83705)

(declare-fun array_inv!30866 (array!83705) Bool)

(assert (=> start!108240 (array_inv!30866 _keys!1427)))

(declare-fun mapIsEmpty!51461 () Bool)

(declare-fun mapRes!51461 () Bool)

(assert (=> mapIsEmpty!51461 mapRes!51461))

(declare-fun b!1277143 () Bool)

(assert (=> b!1277143 (= e!729271 false)))

(declare-fun lt!575885 () Bool)

(declare-datatypes ((List!28655 0))(
  ( (Nil!28652) (Cons!28651 (h!29869 (_ BitVec 64)) (t!42183 List!28655)) )
))
(declare-fun arrayNoDuplicates!0 (array!83705 (_ BitVec 32) List!28655) Bool)

(assert (=> b!1277143 (= lt!575885 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28652))))

(declare-fun b!1277144 () Bool)

(declare-fun res!848484 () Bool)

(assert (=> b!1277144 (=> (not res!848484) (not e!729271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83705 (_ BitVec 32)) Bool)

(assert (=> b!1277144 (= res!848484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277145 () Bool)

(declare-fun e!729268 () Bool)

(assert (=> b!1277145 (= e!729270 (and e!729268 mapRes!51461))))

(declare-fun condMapEmpty!51461 () Bool)

(declare-fun mapDefault!51461 () ValueCell!15746)

(assert (=> b!1277145 (= condMapEmpty!51461 (= (arr!40359 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15746)) mapDefault!51461)))))

(declare-fun mapNonEmpty!51461 () Bool)

(declare-fun tp!98219 () Bool)

(declare-fun e!729269 () Bool)

(assert (=> mapNonEmpty!51461 (= mapRes!51461 (and tp!98219 e!729269))))

(declare-fun mapRest!51461 () (Array (_ BitVec 32) ValueCell!15746))

(declare-fun mapValue!51461 () ValueCell!15746)

(declare-fun mapKey!51461 () (_ BitVec 32))

(assert (=> mapNonEmpty!51461 (= (arr!40359 _values!1187) (store mapRest!51461 mapKey!51461 mapValue!51461))))

(declare-fun b!1277146 () Bool)

(declare-fun tp_is_empty!33289 () Bool)

(assert (=> b!1277146 (= e!729269 tp_is_empty!33289)))

(declare-fun b!1277147 () Bool)

(assert (=> b!1277147 (= e!729268 tp_is_empty!33289)))

(declare-fun b!1277148 () Bool)

(declare-fun res!848483 () Bool)

(assert (=> b!1277148 (=> (not res!848483) (not e!729271))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277148 (= res!848483 (and (= (size!40910 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40911 _keys!1427) (size!40910 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108240 res!848485) b!1277148))

(assert (= (and b!1277148 res!848483) b!1277144))

(assert (= (and b!1277144 res!848484) b!1277143))

(assert (= (and b!1277145 condMapEmpty!51461) mapIsEmpty!51461))

(assert (= (and b!1277145 (not condMapEmpty!51461)) mapNonEmpty!51461))

(get-info :version)

(assert (= (and mapNonEmpty!51461 ((_ is ValueCellFull!15746) mapValue!51461)) b!1277146))

(assert (= (and b!1277145 ((_ is ValueCellFull!15746) mapDefault!51461)) b!1277147))

(assert (= start!108240 b!1277145))

(declare-fun m!1173555 () Bool)

(assert (=> start!108240 m!1173555))

(declare-fun m!1173557 () Bool)

(assert (=> start!108240 m!1173557))

(declare-fun m!1173559 () Bool)

(assert (=> start!108240 m!1173559))

(declare-fun m!1173561 () Bool)

(assert (=> b!1277143 m!1173561))

(declare-fun m!1173563 () Bool)

(assert (=> b!1277144 m!1173563))

(declare-fun m!1173565 () Bool)

(assert (=> mapNonEmpty!51461 m!1173565))

(check-sat (not b!1277143) (not start!108240) tp_is_empty!33289 (not mapNonEmpty!51461) (not b!1277144))
(check-sat)
