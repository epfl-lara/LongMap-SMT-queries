; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37320 () Bool)

(assert start!37320)

(declare-fun b_free!8461 () Bool)

(declare-fun b_next!8461 () Bool)

(assert (=> start!37320 (= b_free!8461 (not b_next!8461))))

(declare-fun tp!30098 () Bool)

(declare-fun b_and!15677 () Bool)

(assert (=> start!37320 (= tp!30098 b_and!15677)))

(declare-fun b!378554 () Bool)

(declare-fun e!230359 () Bool)

(declare-fun e!230360 () Bool)

(declare-fun mapRes!15228 () Bool)

(assert (=> b!378554 (= e!230359 (and e!230360 mapRes!15228))))

(declare-fun condMapEmpty!15228 () Bool)

(declare-datatypes ((V!13251 0))(
  ( (V!13252 (val!4599 Int)) )
))
(declare-datatypes ((ValueCell!4211 0))(
  ( (ValueCellFull!4211 (v!6790 V!13251)) (EmptyCell!4211) )
))
(declare-datatypes ((array!22125 0))(
  ( (array!22126 (arr!10531 (Array (_ BitVec 32) ValueCell!4211)) (size!10884 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22125)

(declare-fun mapDefault!15228 () ValueCell!4211)

(assert (=> b!378554 (= condMapEmpty!15228 (= (arr!10531 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4211)) mapDefault!15228)))))

(declare-fun mapIsEmpty!15228 () Bool)

(assert (=> mapIsEmpty!15228 mapRes!15228))

(declare-fun b!378555 () Bool)

(declare-fun res!214535 () Bool)

(declare-fun e!230355 () Bool)

(assert (=> b!378555 (=> (not res!214535) (not e!230355))))

(declare-datatypes ((array!22127 0))(
  ( (array!22128 (arr!10532 (Array (_ BitVec 32) (_ BitVec 64))) (size!10885 (_ BitVec 32))) )
))
(declare-fun lt!176418 () array!22127)

(declare-datatypes ((List!5953 0))(
  ( (Nil!5950) (Cons!5949 (h!6805 (_ BitVec 64)) (t!11094 List!5953)) )
))
(declare-fun arrayNoDuplicates!0 (array!22127 (_ BitVec 32) List!5953) Bool)

(assert (=> b!378555 (= res!214535 (arrayNoDuplicates!0 lt!176418 #b00000000000000000000000000000000 Nil!5950))))

(declare-fun b!378556 () Bool)

(declare-fun res!214538 () Bool)

(declare-fun e!230356 () Bool)

(assert (=> b!378556 (=> (not res!214538) (not e!230356))))

(declare-fun _keys!658 () array!22127)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378556 (= res!214538 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378557 () Bool)

(assert (=> b!378557 (= e!230356 e!230355)))

(declare-fun res!214533 () Bool)

(assert (=> b!378557 (=> (not res!214533) (not e!230355))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22127 (_ BitVec 32)) Bool)

(assert (=> b!378557 (= res!214533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176418 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378557 (= lt!176418 (array!22128 (store (arr!10532 _keys!658) i!548 k0!778) (size!10885 _keys!658)))))

(declare-fun b!378558 () Bool)

(declare-fun res!214531 () Bool)

(assert (=> b!378558 (=> (not res!214531) (not e!230356))))

(assert (=> b!378558 (= res!214531 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5950))))

(declare-fun res!214527 () Bool)

(assert (=> start!37320 (=> (not res!214527) (not e!230356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37320 (= res!214527 (validMask!0 mask!970))))

(assert (=> start!37320 e!230356))

(declare-fun array_inv!7762 (array!22125) Bool)

(assert (=> start!37320 (and (array_inv!7762 _values!506) e!230359)))

(assert (=> start!37320 tp!30098))

(assert (=> start!37320 true))

(declare-fun tp_is_empty!9109 () Bool)

(assert (=> start!37320 tp_is_empty!9109))

(declare-fun array_inv!7763 (array!22127) Bool)

(assert (=> start!37320 (array_inv!7763 _keys!658)))

(declare-fun b!378559 () Bool)

(declare-fun res!214530 () Bool)

(assert (=> b!378559 (=> (not res!214530) (not e!230356))))

(assert (=> b!378559 (= res!214530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378560 () Bool)

(declare-fun res!214534 () Bool)

(assert (=> b!378560 (=> (not res!214534) (not e!230356))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378560 (= res!214534 (and (= (size!10884 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10885 _keys!658) (size!10884 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378561 () Bool)

(declare-fun e!230354 () Bool)

(assert (=> b!378561 (= e!230354 true)))

(declare-datatypes ((tuple2!6124 0))(
  ( (tuple2!6125 (_1!3073 (_ BitVec 64)) (_2!3073 V!13251)) )
))
(declare-datatypes ((List!5954 0))(
  ( (Nil!5951) (Cons!5950 (h!6806 tuple2!6124) (t!11095 List!5954)) )
))
(declare-datatypes ((ListLongMap!5027 0))(
  ( (ListLongMap!5028 (toList!2529 List!5954)) )
))
(declare-fun lt!176430 () ListLongMap!5027)

(declare-fun lt!176426 () ListLongMap!5027)

(declare-fun lt!176421 () tuple2!6124)

(declare-fun +!897 (ListLongMap!5027 tuple2!6124) ListLongMap!5027)

(assert (=> b!378561 (= lt!176430 (+!897 lt!176426 lt!176421))))

(declare-fun v!373 () V!13251)

(declare-fun minValue!472 () V!13251)

(declare-datatypes ((Unit!11660 0))(
  ( (Unit!11661) )
))
(declare-fun lt!176420 () Unit!11660)

(declare-fun lt!176423 () ListLongMap!5027)

(declare-fun addCommutativeForDiffKeys!297 (ListLongMap!5027 (_ BitVec 64) V!13251 (_ BitVec 64) V!13251) Unit!11660)

(assert (=> b!378561 (= lt!176420 (addCommutativeForDiffKeys!297 lt!176423 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378562 () Bool)

(assert (=> b!378562 (= e!230360 tp_is_empty!9109)))

(declare-fun b!378563 () Bool)

(declare-fun res!214529 () Bool)

(assert (=> b!378563 (=> (not res!214529) (not e!230356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378563 (= res!214529 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15228 () Bool)

(declare-fun tp!30099 () Bool)

(declare-fun e!230353 () Bool)

(assert (=> mapNonEmpty!15228 (= mapRes!15228 (and tp!30099 e!230353))))

(declare-fun mapKey!15228 () (_ BitVec 32))

(declare-fun mapValue!15228 () ValueCell!4211)

(declare-fun mapRest!15228 () (Array (_ BitVec 32) ValueCell!4211))

(assert (=> mapNonEmpty!15228 (= (arr!10531 _values!506) (store mapRest!15228 mapKey!15228 mapValue!15228))))

(declare-fun b!378564 () Bool)

(declare-fun res!214536 () Bool)

(assert (=> b!378564 (=> (not res!214536) (not e!230356))))

(assert (=> b!378564 (= res!214536 (or (= (select (arr!10532 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10532 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378565 () Bool)

(declare-fun res!214528 () Bool)

(assert (=> b!378565 (=> (not res!214528) (not e!230356))))

(assert (=> b!378565 (= res!214528 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10885 _keys!658))))))

(declare-fun b!378566 () Bool)

(declare-fun e!230358 () Bool)

(assert (=> b!378566 (= e!230355 (not e!230358))))

(declare-fun res!214532 () Bool)

(assert (=> b!378566 (=> res!214532 e!230358)))

(assert (=> b!378566 (= res!214532 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!176425 () ListLongMap!5027)

(declare-fun zeroValue!472 () V!13251)

(declare-fun getCurrentListMap!1932 (array!22127 array!22125 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!378566 (= lt!176425 (getCurrentListMap!1932 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176419 () array!22125)

(declare-fun lt!176428 () ListLongMap!5027)

(assert (=> b!378566 (= lt!176428 (getCurrentListMap!1932 lt!176418 lt!176419 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176427 () ListLongMap!5027)

(declare-fun lt!176424 () ListLongMap!5027)

(assert (=> b!378566 (and (= lt!176427 lt!176424) (= lt!176424 lt!176427))))

(assert (=> b!378566 (= lt!176424 (+!897 lt!176423 lt!176421))))

(assert (=> b!378566 (= lt!176421 (tuple2!6125 k0!778 v!373))))

(declare-fun lt!176422 () Unit!11660)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!125 (array!22127 array!22125 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) (_ BitVec 64) V!13251 (_ BitVec 32) Int) Unit!11660)

(assert (=> b!378566 (= lt!176422 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!125 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!797 (array!22127 array!22125 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!378566 (= lt!176427 (getCurrentListMapNoExtraKeys!797 lt!176418 lt!176419 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378566 (= lt!176419 (array!22126 (store (arr!10531 _values!506) i!548 (ValueCellFull!4211 v!373)) (size!10884 _values!506)))))

(assert (=> b!378566 (= lt!176423 (getCurrentListMapNoExtraKeys!797 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378567 () Bool)

(assert (=> b!378567 (= e!230353 tp_is_empty!9109)))

(declare-fun b!378568 () Bool)

(assert (=> b!378568 (= e!230358 e!230354)))

(declare-fun res!214537 () Bool)

(assert (=> b!378568 (=> res!214537 e!230354)))

(assert (=> b!378568 (= res!214537 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!378568 (= lt!176425 lt!176426)))

(declare-fun lt!176429 () tuple2!6124)

(assert (=> b!378568 (= lt!176426 (+!897 lt!176423 lt!176429))))

(assert (=> b!378568 (= lt!176428 lt!176430)))

(assert (=> b!378568 (= lt!176430 (+!897 lt!176424 lt!176429))))

(assert (=> b!378568 (= lt!176428 (+!897 lt!176427 lt!176429))))

(assert (=> b!378568 (= lt!176429 (tuple2!6125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37320 res!214527) b!378560))

(assert (= (and b!378560 res!214534) b!378559))

(assert (= (and b!378559 res!214530) b!378558))

(assert (= (and b!378558 res!214531) b!378565))

(assert (= (and b!378565 res!214528) b!378563))

(assert (= (and b!378563 res!214529) b!378564))

(assert (= (and b!378564 res!214536) b!378556))

(assert (= (and b!378556 res!214538) b!378557))

(assert (= (and b!378557 res!214533) b!378555))

(assert (= (and b!378555 res!214535) b!378566))

(assert (= (and b!378566 (not res!214532)) b!378568))

(assert (= (and b!378568 (not res!214537)) b!378561))

(assert (= (and b!378554 condMapEmpty!15228) mapIsEmpty!15228))

(assert (= (and b!378554 (not condMapEmpty!15228)) mapNonEmpty!15228))

(get-info :version)

(assert (= (and mapNonEmpty!15228 ((_ is ValueCellFull!4211) mapValue!15228)) b!378567))

(assert (= (and b!378554 ((_ is ValueCellFull!4211) mapDefault!15228)) b!378562))

(assert (= start!37320 b!378554))

(declare-fun m!374939 () Bool)

(assert (=> b!378564 m!374939))

(declare-fun m!374941 () Bool)

(assert (=> b!378566 m!374941))

(declare-fun m!374943 () Bool)

(assert (=> b!378566 m!374943))

(declare-fun m!374945 () Bool)

(assert (=> b!378566 m!374945))

(declare-fun m!374947 () Bool)

(assert (=> b!378566 m!374947))

(declare-fun m!374949 () Bool)

(assert (=> b!378566 m!374949))

(declare-fun m!374951 () Bool)

(assert (=> b!378566 m!374951))

(declare-fun m!374953 () Bool)

(assert (=> b!378566 m!374953))

(declare-fun m!374955 () Bool)

(assert (=> b!378557 m!374955))

(declare-fun m!374957 () Bool)

(assert (=> b!378557 m!374957))

(declare-fun m!374959 () Bool)

(assert (=> start!37320 m!374959))

(declare-fun m!374961 () Bool)

(assert (=> start!37320 m!374961))

(declare-fun m!374963 () Bool)

(assert (=> start!37320 m!374963))

(declare-fun m!374965 () Bool)

(assert (=> b!378558 m!374965))

(declare-fun m!374967 () Bool)

(assert (=> b!378563 m!374967))

(declare-fun m!374969 () Bool)

(assert (=> b!378559 m!374969))

(declare-fun m!374971 () Bool)

(assert (=> b!378561 m!374971))

(declare-fun m!374973 () Bool)

(assert (=> b!378561 m!374973))

(declare-fun m!374975 () Bool)

(assert (=> b!378568 m!374975))

(declare-fun m!374977 () Bool)

(assert (=> b!378568 m!374977))

(declare-fun m!374979 () Bool)

(assert (=> b!378568 m!374979))

(declare-fun m!374981 () Bool)

(assert (=> b!378555 m!374981))

(declare-fun m!374983 () Bool)

(assert (=> b!378556 m!374983))

(declare-fun m!374985 () Bool)

(assert (=> mapNonEmpty!15228 m!374985))

(check-sat (not b!378568) (not b!378561) (not b!378556) (not b!378559) tp_is_empty!9109 (not b_next!8461) b_and!15677 (not b!378558) (not b!378557) (not b!378555) (not b!378566) (not start!37320) (not b!378563) (not mapNonEmpty!15228))
(check-sat b_and!15677 (not b_next!8461))
