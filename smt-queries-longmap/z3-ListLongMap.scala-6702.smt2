; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84352 () Bool)

(assert start!84352)

(declare-fun b_free!19885 () Bool)

(declare-fun b_next!19885 () Bool)

(assert (=> start!84352 (= b_free!19885 (not b_next!19885))))

(declare-fun tp!69260 () Bool)

(declare-fun b_and!31857 () Bool)

(assert (=> start!84352 (= tp!69260 b_and!31857)))

(declare-fun b!985430 () Bool)

(declare-fun res!659137 () Bool)

(declare-fun e!555592 () Bool)

(assert (=> b!985430 (=> (not res!659137) (not e!555592))))

(declare-datatypes ((array!61992 0))(
  ( (array!61993 (arr!29849 (Array (_ BitVec 32) (_ BitVec 64))) (size!30329 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61992)

(declare-datatypes ((List!20666 0))(
  ( (Nil!20663) (Cons!20662 (h!21830 (_ BitVec 64)) (t!29487 List!20666)) )
))
(declare-fun arrayNoDuplicates!0 (array!61992 (_ BitVec 32) List!20666) Bool)

(assert (=> b!985430 (= res!659137 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20663))))

(declare-fun b!985431 () Bool)

(declare-fun e!555590 () Bool)

(declare-fun tp_is_empty!22987 () Bool)

(assert (=> b!985431 (= e!555590 tp_is_empty!22987)))

(declare-fun b!985432 () Bool)

(declare-fun res!659139 () Bool)

(assert (=> b!985432 (=> (not res!659139) (not e!555592))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985432 (= res!659139 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30329 _keys!1544))))))

(declare-fun b!985433 () Bool)

(declare-fun e!555591 () Bool)

(assert (=> b!985433 (= e!555591 (not true))))

(declare-datatypes ((V!35633 0))(
  ( (V!35634 (val!11544 Int)) )
))
(declare-datatypes ((tuple2!14786 0))(
  ( (tuple2!14787 (_1!7404 (_ BitVec 64)) (_2!7404 V!35633)) )
))
(declare-datatypes ((List!20667 0))(
  ( (Nil!20664) (Cons!20663 (h!21831 tuple2!14786) (t!29488 List!20667)) )
))
(declare-datatypes ((ListLongMap!13485 0))(
  ( (ListLongMap!13486 (toList!6758 List!20667)) )
))
(declare-fun lt!437216 () ListLongMap!13485)

(declare-fun lt!437214 () tuple2!14786)

(declare-fun lt!437217 () tuple2!14786)

(declare-fun +!3061 (ListLongMap!13485 tuple2!14786) ListLongMap!13485)

(assert (=> b!985433 (= (+!3061 (+!3061 lt!437216 lt!437214) lt!437217) (+!3061 (+!3061 lt!437216 lt!437217) lt!437214))))

(declare-fun lt!437213 () V!35633)

(assert (=> b!985433 (= lt!437217 (tuple2!14787 (select (arr!29849 _keys!1544) from!1932) lt!437213))))

(declare-fun minValue!1220 () V!35633)

(assert (=> b!985433 (= lt!437214 (tuple2!14787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32702 0))(
  ( (Unit!32703) )
))
(declare-fun lt!437215 () Unit!32702)

(declare-fun addCommutativeForDiffKeys!668 (ListLongMap!13485 (_ BitVec 64) V!35633 (_ BitVec 64) V!35633) Unit!32702)

(assert (=> b!985433 (= lt!437215 (addCommutativeForDiffKeys!668 lt!437216 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29849 _keys!1544) from!1932) lt!437213))))

(declare-fun b!985435 () Bool)

(assert (=> b!985435 (= e!555592 e!555591)))

(declare-fun res!659142 () Bool)

(assert (=> b!985435 (=> (not res!659142) (not e!555591))))

(assert (=> b!985435 (= res!659142 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29849 _keys!1544) from!1932))))))

(declare-datatypes ((ValueCell!11012 0))(
  ( (ValueCellFull!11012 (v!14103 V!35633)) (EmptyCell!11012) )
))
(declare-datatypes ((array!61994 0))(
  ( (array!61995 (arr!29850 (Array (_ BitVec 32) ValueCell!11012)) (size!30330 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61994)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15511 (ValueCell!11012 V!35633) V!35633)

(declare-fun dynLambda!1850 (Int (_ BitVec 64)) V!35633)

(assert (=> b!985435 (= lt!437213 (get!15511 (select (arr!29850 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35633)

(declare-fun getCurrentListMapNoExtraKeys!3493 (array!61992 array!61994 (_ BitVec 32) (_ BitVec 32) V!35633 V!35633 (_ BitVec 32) Int) ListLongMap!13485)

(assert (=> b!985435 (= lt!437216 (getCurrentListMapNoExtraKeys!3493 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36509 () Bool)

(declare-fun mapRes!36509 () Bool)

(assert (=> mapIsEmpty!36509 mapRes!36509))

(declare-fun b!985436 () Bool)

(declare-fun res!659136 () Bool)

(assert (=> b!985436 (=> (not res!659136) (not e!555592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61992 (_ BitVec 32)) Bool)

(assert (=> b!985436 (= res!659136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985437 () Bool)

(declare-fun e!555594 () Bool)

(declare-fun e!555593 () Bool)

(assert (=> b!985437 (= e!555594 (and e!555593 mapRes!36509))))

(declare-fun condMapEmpty!36509 () Bool)

(declare-fun mapDefault!36509 () ValueCell!11012)

(assert (=> b!985437 (= condMapEmpty!36509 (= (arr!29850 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11012)) mapDefault!36509)))))

(declare-fun b!985438 () Bool)

(declare-fun res!659140 () Bool)

(assert (=> b!985438 (=> (not res!659140) (not e!555592))))

(assert (=> b!985438 (= res!659140 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36509 () Bool)

(declare-fun tp!69259 () Bool)

(assert (=> mapNonEmpty!36509 (= mapRes!36509 (and tp!69259 e!555590))))

(declare-fun mapValue!36509 () ValueCell!11012)

(declare-fun mapRest!36509 () (Array (_ BitVec 32) ValueCell!11012))

(declare-fun mapKey!36509 () (_ BitVec 32))

(assert (=> mapNonEmpty!36509 (= (arr!29850 _values!1278) (store mapRest!36509 mapKey!36509 mapValue!36509))))

(declare-fun b!985439 () Bool)

(assert (=> b!985439 (= e!555593 tp_is_empty!22987)))

(declare-fun b!985440 () Bool)

(declare-fun res!659141 () Bool)

(assert (=> b!985440 (=> (not res!659141) (not e!555592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985440 (= res!659141 (validKeyInArray!0 (select (arr!29849 _keys!1544) from!1932)))))

(declare-fun res!659138 () Bool)

(assert (=> start!84352 (=> (not res!659138) (not e!555592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84352 (= res!659138 (validMask!0 mask!1948))))

(assert (=> start!84352 e!555592))

(assert (=> start!84352 true))

(assert (=> start!84352 tp_is_empty!22987))

(declare-fun array_inv!23095 (array!61994) Bool)

(assert (=> start!84352 (and (array_inv!23095 _values!1278) e!555594)))

(assert (=> start!84352 tp!69260))

(declare-fun array_inv!23096 (array!61992) Bool)

(assert (=> start!84352 (array_inv!23096 _keys!1544)))

(declare-fun b!985434 () Bool)

(declare-fun res!659143 () Bool)

(assert (=> b!985434 (=> (not res!659143) (not e!555592))))

(assert (=> b!985434 (= res!659143 (and (= (size!30330 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30329 _keys!1544) (size!30330 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84352 res!659138) b!985434))

(assert (= (and b!985434 res!659143) b!985436))

(assert (= (and b!985436 res!659136) b!985430))

(assert (= (and b!985430 res!659137) b!985432))

(assert (= (and b!985432 res!659139) b!985440))

(assert (= (and b!985440 res!659141) b!985438))

(assert (= (and b!985438 res!659140) b!985435))

(assert (= (and b!985435 res!659142) b!985433))

(assert (= (and b!985437 condMapEmpty!36509) mapIsEmpty!36509))

(assert (= (and b!985437 (not condMapEmpty!36509)) mapNonEmpty!36509))

(get-info :version)

(assert (= (and mapNonEmpty!36509 ((_ is ValueCellFull!11012) mapValue!36509)) b!985431))

(assert (= (and b!985437 ((_ is ValueCellFull!11012) mapDefault!36509)) b!985439))

(assert (= start!84352 b!985437))

(declare-fun b_lambda!14931 () Bool)

(assert (=> (not b_lambda!14931) (not b!985435)))

(declare-fun t!29486 () Bool)

(declare-fun tb!6671 () Bool)

(assert (=> (and start!84352 (= defaultEntry!1281 defaultEntry!1281) t!29486) tb!6671))

(declare-fun result!13339 () Bool)

(assert (=> tb!6671 (= result!13339 tp_is_empty!22987)))

(assert (=> b!985435 t!29486))

(declare-fun b_and!31859 () Bool)

(assert (= b_and!31857 (and (=> t!29486 result!13339) b_and!31859)))

(declare-fun m!912905 () Bool)

(assert (=> start!84352 m!912905))

(declare-fun m!912907 () Bool)

(assert (=> start!84352 m!912907))

(declare-fun m!912909 () Bool)

(assert (=> start!84352 m!912909))

(declare-fun m!912911 () Bool)

(assert (=> b!985433 m!912911))

(declare-fun m!912913 () Bool)

(assert (=> b!985433 m!912913))

(declare-fun m!912915 () Bool)

(assert (=> b!985433 m!912915))

(assert (=> b!985433 m!912915))

(declare-fun m!912917 () Bool)

(assert (=> b!985433 m!912917))

(declare-fun m!912919 () Bool)

(assert (=> b!985433 m!912919))

(assert (=> b!985433 m!912919))

(declare-fun m!912921 () Bool)

(assert (=> b!985433 m!912921))

(assert (=> b!985433 m!912911))

(assert (=> b!985435 m!912915))

(declare-fun m!912923 () Bool)

(assert (=> b!985435 m!912923))

(declare-fun m!912925 () Bool)

(assert (=> b!985435 m!912925))

(declare-fun m!912927 () Bool)

(assert (=> b!985435 m!912927))

(assert (=> b!985435 m!912923))

(assert (=> b!985435 m!912927))

(declare-fun m!912929 () Bool)

(assert (=> b!985435 m!912929))

(assert (=> b!985440 m!912915))

(assert (=> b!985440 m!912915))

(declare-fun m!912931 () Bool)

(assert (=> b!985440 m!912931))

(declare-fun m!912933 () Bool)

(assert (=> b!985436 m!912933))

(declare-fun m!912935 () Bool)

(assert (=> mapNonEmpty!36509 m!912935))

(declare-fun m!912937 () Bool)

(assert (=> b!985430 m!912937))

(check-sat (not b!985433) (not b_lambda!14931) tp_is_empty!22987 (not b!985430) b_and!31859 (not b_next!19885) (not start!84352) (not b!985440) (not mapNonEmpty!36509) (not b!985435) (not b!985436))
(check-sat b_and!31859 (not b_next!19885))
