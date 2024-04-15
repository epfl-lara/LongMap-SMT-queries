; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84274 () Bool)

(assert start!84274)

(declare-fun b!985862 () Bool)

(declare-fun res!659698 () Bool)

(declare-fun e!555777 () Bool)

(assert (=> b!985862 (=> (not res!659698) (not e!555777))))

(declare-datatypes ((array!62090 0))(
  ( (array!62091 (arr!29903 (Array (_ BitVec 32) (_ BitVec 64))) (size!30384 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62090)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62090 (_ BitVec 32)) Bool)

(assert (=> b!985862 (= res!659698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985863 () Bool)

(declare-fun e!555779 () Bool)

(declare-fun tp_is_empty!23095 () Bool)

(assert (=> b!985863 (= e!555779 tp_is_empty!23095)))

(declare-fun b!985864 () Bool)

(assert (=> b!985864 (= e!555777 false)))

(declare-fun lt!437202 () Bool)

(declare-datatypes ((List!20764 0))(
  ( (Nil!20761) (Cons!20760 (h!21922 (_ BitVec 64)) (t!29654 List!20764)) )
))
(declare-fun arrayNoDuplicates!0 (array!62090 (_ BitVec 32) List!20764) Bool)

(assert (=> b!985864 (= lt!437202 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20761))))

(declare-fun b!985865 () Bool)

(declare-fun e!555775 () Bool)

(assert (=> b!985865 (= e!555775 tp_is_empty!23095)))

(declare-fun res!659700 () Bool)

(assert (=> start!84274 (=> (not res!659700) (not e!555777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84274 (= res!659700 (validMask!0 mask!1948))))

(assert (=> start!84274 e!555777))

(assert (=> start!84274 true))

(declare-datatypes ((V!35777 0))(
  ( (V!35778 (val!11598 Int)) )
))
(declare-datatypes ((ValueCell!11066 0))(
  ( (ValueCellFull!11066 (v!14159 V!35777)) (EmptyCell!11066) )
))
(declare-datatypes ((array!62092 0))(
  ( (array!62093 (arr!29904 (Array (_ BitVec 32) ValueCell!11066)) (size!30385 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62092)

(declare-fun e!555778 () Bool)

(declare-fun array_inv!23119 (array!62092) Bool)

(assert (=> start!84274 (and (array_inv!23119 _values!1278) e!555778)))

(declare-fun array_inv!23120 (array!62090) Bool)

(assert (=> start!84274 (array_inv!23120 _keys!1544)))

(declare-fun mapIsEmpty!36671 () Bool)

(declare-fun mapRes!36671 () Bool)

(assert (=> mapIsEmpty!36671 mapRes!36671))

(declare-fun mapNonEmpty!36671 () Bool)

(declare-fun tp!69527 () Bool)

(assert (=> mapNonEmpty!36671 (= mapRes!36671 (and tp!69527 e!555775))))

(declare-fun mapKey!36671 () (_ BitVec 32))

(declare-fun mapValue!36671 () ValueCell!11066)

(declare-fun mapRest!36671 () (Array (_ BitVec 32) ValueCell!11066))

(assert (=> mapNonEmpty!36671 (= (arr!29904 _values!1278) (store mapRest!36671 mapKey!36671 mapValue!36671))))

(declare-fun b!985866 () Bool)

(assert (=> b!985866 (= e!555778 (and e!555779 mapRes!36671))))

(declare-fun condMapEmpty!36671 () Bool)

(declare-fun mapDefault!36671 () ValueCell!11066)

(assert (=> b!985866 (= condMapEmpty!36671 (= (arr!29904 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11066)) mapDefault!36671)))))

(declare-fun b!985867 () Bool)

(declare-fun res!659699 () Bool)

(assert (=> b!985867 (=> (not res!659699) (not e!555777))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985867 (= res!659699 (and (= (size!30385 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30384 _keys!1544) (size!30385 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84274 res!659700) b!985867))

(assert (= (and b!985867 res!659699) b!985862))

(assert (= (and b!985862 res!659698) b!985864))

(assert (= (and b!985866 condMapEmpty!36671) mapIsEmpty!36671))

(assert (= (and b!985866 (not condMapEmpty!36671)) mapNonEmpty!36671))

(get-info :version)

(assert (= (and mapNonEmpty!36671 ((_ is ValueCellFull!11066) mapValue!36671)) b!985865))

(assert (= (and b!985866 ((_ is ValueCellFull!11066) mapDefault!36671)) b!985863))

(assert (= start!84274 b!985866))

(declare-fun m!912293 () Bool)

(assert (=> b!985862 m!912293))

(declare-fun m!912295 () Bool)

(assert (=> b!985864 m!912295))

(declare-fun m!912297 () Bool)

(assert (=> start!84274 m!912297))

(declare-fun m!912299 () Bool)

(assert (=> start!84274 m!912299))

(declare-fun m!912301 () Bool)

(assert (=> start!84274 m!912301))

(declare-fun m!912303 () Bool)

(assert (=> mapNonEmpty!36671 m!912303))

(check-sat (not start!84274) tp_is_empty!23095 (not b!985862) (not b!985864) (not mapNonEmpty!36671))
(check-sat)
