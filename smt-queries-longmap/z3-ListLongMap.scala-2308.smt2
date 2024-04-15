; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37296 () Bool)

(assert start!37296)

(declare-fun b_free!8437 () Bool)

(declare-fun b_next!8437 () Bool)

(assert (=> start!37296 (= b_free!8437 (not b_next!8437))))

(declare-fun tp!30026 () Bool)

(declare-fun b_and!15653 () Bool)

(assert (=> start!37296 (= tp!30026 b_and!15653)))

(declare-fun b!378007 () Bool)

(declare-fun res!214091 () Bool)

(declare-fun e!230072 () Bool)

(assert (=> b!378007 (=> (not res!214091) (not e!230072))))

(declare-datatypes ((array!22077 0))(
  ( (array!22078 (arr!10507 (Array (_ BitVec 32) (_ BitVec 64))) (size!10860 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22077)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378007 (= res!214091 (or (= (select (arr!10507 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10507 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378008 () Bool)

(declare-fun res!214092 () Bool)

(assert (=> b!378008 (=> (not res!214092) (not e!230072))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22077 (_ BitVec 32)) Bool)

(assert (=> b!378008 (= res!214092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378009 () Bool)

(declare-fun e!230068 () Bool)

(declare-fun e!230066 () Bool)

(declare-fun mapRes!15192 () Bool)

(assert (=> b!378009 (= e!230068 (and e!230066 mapRes!15192))))

(declare-fun condMapEmpty!15192 () Bool)

(declare-datatypes ((V!13219 0))(
  ( (V!13220 (val!4587 Int)) )
))
(declare-datatypes ((ValueCell!4199 0))(
  ( (ValueCellFull!4199 (v!6778 V!13219)) (EmptyCell!4199) )
))
(declare-datatypes ((array!22079 0))(
  ( (array!22080 (arr!10508 (Array (_ BitVec 32) ValueCell!4199)) (size!10861 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22079)

(declare-fun mapDefault!15192 () ValueCell!4199)

(assert (=> b!378009 (= condMapEmpty!15192 (= (arr!10508 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4199)) mapDefault!15192)))))

(declare-fun b!378010 () Bool)

(declare-fun res!214090 () Bool)

(assert (=> b!378010 (=> (not res!214090) (not e!230072))))

(assert (=> b!378010 (= res!214090 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10860 _keys!658))))))

(declare-datatypes ((tuple2!6102 0))(
  ( (tuple2!6103 (_1!3062 (_ BitVec 64)) (_2!3062 V!13219)) )
))
(declare-fun lt!175980 () tuple2!6102)

(declare-fun b!378011 () Bool)

(declare-datatypes ((List!5931 0))(
  ( (Nil!5928) (Cons!5927 (h!6783 tuple2!6102) (t!11072 List!5931)) )
))
(declare-datatypes ((ListLongMap!5005 0))(
  ( (ListLongMap!5006 (toList!2518 List!5931)) )
))
(declare-fun lt!175978 () ListLongMap!5005)

(declare-fun lt!175984 () ListLongMap!5005)

(declare-fun e!230070 () Bool)

(declare-fun +!886 (ListLongMap!5005 tuple2!6102) ListLongMap!5005)

(assert (=> b!378011 (= e!230070 (= lt!175984 (+!886 lt!175978 lt!175980)))))

(declare-fun b!378012 () Bool)

(declare-fun e!230069 () Bool)

(assert (=> b!378012 (= e!230069 true)))

(assert (=> b!378012 e!230070))

(declare-fun res!214093 () Bool)

(assert (=> b!378012 (=> (not res!214093) (not e!230070))))

(declare-fun lt!175979 () ListLongMap!5005)

(declare-fun lt!175983 () ListLongMap!5005)

(assert (=> b!378012 (= res!214093 (= lt!175983 (+!886 lt!175979 lt!175980)))))

(declare-fun minValue!472 () V!13219)

(assert (=> b!378012 (= lt!175980 (tuple2!6103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15192 () Bool)

(declare-fun tp!30027 () Bool)

(declare-fun e!230071 () Bool)

(assert (=> mapNonEmpty!15192 (= mapRes!15192 (and tp!30027 e!230071))))

(declare-fun mapRest!15192 () (Array (_ BitVec 32) ValueCell!4199))

(declare-fun mapValue!15192 () ValueCell!4199)

(declare-fun mapKey!15192 () (_ BitVec 32))

(assert (=> mapNonEmpty!15192 (= (arr!10508 _values!506) (store mapRest!15192 mapKey!15192 mapValue!15192))))

(declare-fun mapIsEmpty!15192 () Bool)

(assert (=> mapIsEmpty!15192 mapRes!15192))

(declare-fun b!378013 () Bool)

(declare-fun res!214097 () Bool)

(assert (=> b!378013 (=> (not res!214097) (not e!230072))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378013 (= res!214097 (and (= (size!10861 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10860 _keys!658) (size!10861 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!214089 () Bool)

(assert (=> start!37296 (=> (not res!214089) (not e!230072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37296 (= res!214089 (validMask!0 mask!970))))

(assert (=> start!37296 e!230072))

(declare-fun array_inv!7742 (array!22079) Bool)

(assert (=> start!37296 (and (array_inv!7742 _values!506) e!230068)))

(assert (=> start!37296 tp!30026))

(assert (=> start!37296 true))

(declare-fun tp_is_empty!9085 () Bool)

(assert (=> start!37296 tp_is_empty!9085))

(declare-fun array_inv!7743 (array!22077) Bool)

(assert (=> start!37296 (array_inv!7743 _keys!658)))

(declare-fun b!378014 () Bool)

(assert (=> b!378014 (= e!230071 tp_is_empty!9085)))

(declare-fun b!378015 () Bool)

(assert (=> b!378015 (= e!230066 tp_is_empty!9085)))

(declare-fun b!378016 () Bool)

(declare-fun res!214099 () Bool)

(declare-fun e!230067 () Bool)

(assert (=> b!378016 (=> (not res!214099) (not e!230067))))

(declare-fun lt!175981 () array!22077)

(declare-datatypes ((List!5932 0))(
  ( (Nil!5929) (Cons!5928 (h!6784 (_ BitVec 64)) (t!11073 List!5932)) )
))
(declare-fun arrayNoDuplicates!0 (array!22077 (_ BitVec 32) List!5932) Bool)

(assert (=> b!378016 (= res!214099 (arrayNoDuplicates!0 lt!175981 #b00000000000000000000000000000000 Nil!5929))))

(declare-fun b!378017 () Bool)

(assert (=> b!378017 (= e!230072 e!230067)))

(declare-fun res!214095 () Bool)

(assert (=> b!378017 (=> (not res!214095) (not e!230067))))

(assert (=> b!378017 (= res!214095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175981 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378017 (= lt!175981 (array!22078 (store (arr!10507 _keys!658) i!548 k0!778) (size!10860 _keys!658)))))

(declare-fun b!378018 () Bool)

(declare-fun res!214098 () Bool)

(assert (=> b!378018 (=> (not res!214098) (not e!230070))))

(declare-fun lt!175982 () ListLongMap!5005)

(assert (=> b!378018 (= res!214098 (= lt!175983 (+!886 lt!175982 lt!175980)))))

(declare-fun b!378019 () Bool)

(declare-fun res!214088 () Bool)

(assert (=> b!378019 (=> (not res!214088) (not e!230072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378019 (= res!214088 (validKeyInArray!0 k0!778))))

(declare-fun b!378020 () Bool)

(assert (=> b!378020 (= e!230067 (not e!230069))))

(declare-fun res!214096 () Bool)

(assert (=> b!378020 (=> res!214096 e!230069)))

(assert (=> b!378020 (= res!214096 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13219)

(declare-fun getCurrentListMap!1923 (array!22077 array!22079 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!5005)

(assert (=> b!378020 (= lt!175984 (getCurrentListMap!1923 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175985 () array!22079)

(assert (=> b!378020 (= lt!175983 (getCurrentListMap!1923 lt!175981 lt!175985 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378020 (and (= lt!175979 lt!175982) (= lt!175982 lt!175979))))

(declare-fun v!373 () V!13219)

(assert (=> b!378020 (= lt!175982 (+!886 lt!175978 (tuple2!6103 k0!778 v!373)))))

(declare-datatypes ((Unit!11640 0))(
  ( (Unit!11641) )
))
(declare-fun lt!175986 () Unit!11640)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 (array!22077 array!22079 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) (_ BitVec 64) V!13219 (_ BitVec 32) Int) Unit!11640)

(assert (=> b!378020 (= lt!175986 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!116 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!788 (array!22077 array!22079 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!5005)

(assert (=> b!378020 (= lt!175979 (getCurrentListMapNoExtraKeys!788 lt!175981 lt!175985 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378020 (= lt!175985 (array!22080 (store (arr!10508 _values!506) i!548 (ValueCellFull!4199 v!373)) (size!10861 _values!506)))))

(assert (=> b!378020 (= lt!175978 (getCurrentListMapNoExtraKeys!788 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378021 () Bool)

(declare-fun res!214100 () Bool)

(assert (=> b!378021 (=> (not res!214100) (not e!230072))))

(declare-fun arrayContainsKey!0 (array!22077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378021 (= res!214100 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378022 () Bool)

(declare-fun res!214094 () Bool)

(assert (=> b!378022 (=> (not res!214094) (not e!230072))))

(assert (=> b!378022 (= res!214094 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5929))))

(assert (= (and start!37296 res!214089) b!378013))

(assert (= (and b!378013 res!214097) b!378008))

(assert (= (and b!378008 res!214092) b!378022))

(assert (= (and b!378022 res!214094) b!378010))

(assert (= (and b!378010 res!214090) b!378019))

(assert (= (and b!378019 res!214088) b!378007))

(assert (= (and b!378007 res!214091) b!378021))

(assert (= (and b!378021 res!214100) b!378017))

(assert (= (and b!378017 res!214095) b!378016))

(assert (= (and b!378016 res!214099) b!378020))

(assert (= (and b!378020 (not res!214096)) b!378012))

(assert (= (and b!378012 res!214093) b!378018))

(assert (= (and b!378018 res!214098) b!378011))

(assert (= (and b!378009 condMapEmpty!15192) mapIsEmpty!15192))

(assert (= (and b!378009 (not condMapEmpty!15192)) mapNonEmpty!15192))

(get-info :version)

(assert (= (and mapNonEmpty!15192 ((_ is ValueCellFull!4199) mapValue!15192)) b!378014))

(assert (= (and b!378009 ((_ is ValueCellFull!4199) mapDefault!15192)) b!378015))

(assert (= start!37296 b!378009))

(declare-fun m!374375 () Bool)

(assert (=> b!378018 m!374375))

(declare-fun m!374377 () Bool)

(assert (=> b!378021 m!374377))

(declare-fun m!374379 () Bool)

(assert (=> b!378022 m!374379))

(declare-fun m!374381 () Bool)

(assert (=> b!378020 m!374381))

(declare-fun m!374383 () Bool)

(assert (=> b!378020 m!374383))

(declare-fun m!374385 () Bool)

(assert (=> b!378020 m!374385))

(declare-fun m!374387 () Bool)

(assert (=> b!378020 m!374387))

(declare-fun m!374389 () Bool)

(assert (=> b!378020 m!374389))

(declare-fun m!374391 () Bool)

(assert (=> b!378020 m!374391))

(declare-fun m!374393 () Bool)

(assert (=> b!378020 m!374393))

(declare-fun m!374395 () Bool)

(assert (=> b!378012 m!374395))

(declare-fun m!374397 () Bool)

(assert (=> b!378011 m!374397))

(declare-fun m!374399 () Bool)

(assert (=> mapNonEmpty!15192 m!374399))

(declare-fun m!374401 () Bool)

(assert (=> b!378017 m!374401))

(declare-fun m!374403 () Bool)

(assert (=> b!378017 m!374403))

(declare-fun m!374405 () Bool)

(assert (=> start!37296 m!374405))

(declare-fun m!374407 () Bool)

(assert (=> start!37296 m!374407))

(declare-fun m!374409 () Bool)

(assert (=> start!37296 m!374409))

(declare-fun m!374411 () Bool)

(assert (=> b!378007 m!374411))

(declare-fun m!374413 () Bool)

(assert (=> b!378008 m!374413))

(declare-fun m!374415 () Bool)

(assert (=> b!378019 m!374415))

(declare-fun m!374417 () Bool)

(assert (=> b!378016 m!374417))

(check-sat (not mapNonEmpty!15192) (not b!378022) (not b_next!8437) (not start!37296) (not b!378020) tp_is_empty!9085 (not b!378008) (not b!378017) (not b!378016) (not b!378012) (not b!378011) (not b!378018) b_and!15653 (not b!378019) (not b!378021))
(check-sat b_and!15653 (not b_next!8437))
