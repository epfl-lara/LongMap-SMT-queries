; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37290 () Bool)

(assert start!37290)

(declare-fun b_free!8431 () Bool)

(declare-fun b_next!8431 () Bool)

(assert (=> start!37290 (= b_free!8431 (not b_next!8431))))

(declare-fun tp!30009 () Bool)

(declare-fun b_and!15647 () Bool)

(assert (=> start!37290 (= tp!30009 b_and!15647)))

(declare-fun b!377870 () Bool)

(declare-fun res!213983 () Bool)

(declare-fun e!229997 () Bool)

(assert (=> b!377870 (=> (not res!213983) (not e!229997))))

(declare-datatypes ((array!22065 0))(
  ( (array!22066 (arr!10501 (Array (_ BitVec 32) (_ BitVec 64))) (size!10854 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22065)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22065 (_ BitVec 32)) Bool)

(assert (=> b!377870 (= res!213983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377871 () Bool)

(declare-fun res!213978 () Bool)

(assert (=> b!377871 (=> (not res!213978) (not e!229997))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377871 (= res!213978 (or (= (select (arr!10501 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10501 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377872 () Bool)

(declare-fun res!213984 () Bool)

(assert (=> b!377872 (=> (not res!213984) (not e!229997))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377872 (= res!213984 (validKeyInArray!0 k0!778))))

(declare-fun b!377873 () Bool)

(declare-fun e!229994 () Bool)

(declare-fun e!229998 () Bool)

(assert (=> b!377873 (= e!229994 (not e!229998))))

(declare-fun res!213985 () Bool)

(assert (=> b!377873 (=> res!213985 e!229998)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377873 (= res!213985 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13211 0))(
  ( (V!13212 (val!4584 Int)) )
))
(declare-datatypes ((ValueCell!4196 0))(
  ( (ValueCellFull!4196 (v!6775 V!13211)) (EmptyCell!4196) )
))
(declare-datatypes ((array!22067 0))(
  ( (array!22068 (arr!10502 (Array (_ BitVec 32) ValueCell!4196)) (size!10855 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22067)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13211)

(declare-datatypes ((tuple2!6098 0))(
  ( (tuple2!6099 (_1!3060 (_ BitVec 64)) (_2!3060 V!13211)) )
))
(declare-datatypes ((List!5927 0))(
  ( (Nil!5924) (Cons!5923 (h!6779 tuple2!6098) (t!11068 List!5927)) )
))
(declare-datatypes ((ListLongMap!5001 0))(
  ( (ListLongMap!5002 (toList!2516 List!5927)) )
))
(declare-fun lt!175878 () ListLongMap!5001)

(declare-fun minValue!472 () V!13211)

(declare-fun getCurrentListMap!1921 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) Int) ListLongMap!5001)

(assert (=> b!377873 (= lt!175878 (getCurrentListMap!1921 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175872 () array!22067)

(declare-fun lt!175876 () ListLongMap!5001)

(declare-fun lt!175869 () array!22065)

(assert (=> b!377873 (= lt!175876 (getCurrentListMap!1921 lt!175869 lt!175872 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175871 () ListLongMap!5001)

(declare-fun lt!175879 () ListLongMap!5001)

(assert (=> b!377873 (and (= lt!175871 lt!175879) (= lt!175879 lt!175871))))

(declare-fun lt!175870 () ListLongMap!5001)

(declare-fun lt!175875 () tuple2!6098)

(declare-fun +!884 (ListLongMap!5001 tuple2!6098) ListLongMap!5001)

(assert (=> b!377873 (= lt!175879 (+!884 lt!175870 lt!175875))))

(declare-fun v!373 () V!13211)

(assert (=> b!377873 (= lt!175875 (tuple2!6099 k0!778 v!373))))

(declare-datatypes ((Unit!11636 0))(
  ( (Unit!11637) )
))
(declare-fun lt!175881 () Unit!11636)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) (_ BitVec 64) V!13211 (_ BitVec 32) Int) Unit!11636)

(assert (=> b!377873 (= lt!175881 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!786 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13211 V!13211 (_ BitVec 32) Int) ListLongMap!5001)

(assert (=> b!377873 (= lt!175871 (getCurrentListMapNoExtraKeys!786 lt!175869 lt!175872 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377873 (= lt!175872 (array!22068 (store (arr!10502 _values!506) i!548 (ValueCellFull!4196 v!373)) (size!10855 _values!506)))))

(assert (=> b!377873 (= lt!175870 (getCurrentListMapNoExtraKeys!786 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377875 () Bool)

(declare-fun res!213988 () Bool)

(assert (=> b!377875 (=> (not res!213988) (not e!229994))))

(declare-datatypes ((List!5928 0))(
  ( (Nil!5925) (Cons!5924 (h!6780 (_ BitVec 64)) (t!11069 List!5928)) )
))
(declare-fun arrayNoDuplicates!0 (array!22065 (_ BitVec 32) List!5928) Bool)

(assert (=> b!377875 (= res!213988 (arrayNoDuplicates!0 lt!175869 #b00000000000000000000000000000000 Nil!5925))))

(declare-fun b!377876 () Bool)

(declare-fun e!229993 () Bool)

(declare-fun e!229999 () Bool)

(declare-fun mapRes!15183 () Bool)

(assert (=> b!377876 (= e!229993 (and e!229999 mapRes!15183))))

(declare-fun condMapEmpty!15183 () Bool)

(declare-fun mapDefault!15183 () ValueCell!4196)

(assert (=> b!377876 (= condMapEmpty!15183 (= (arr!10502 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4196)) mapDefault!15183)))))

(declare-fun b!377877 () Bool)

(declare-fun res!213989 () Bool)

(assert (=> b!377877 (=> (not res!213989) (not e!229997))))

(declare-fun arrayContainsKey!0 (array!22065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377877 (= res!213989 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377878 () Bool)

(assert (=> b!377878 (= e!229997 e!229994)))

(declare-fun res!213982 () Bool)

(assert (=> b!377878 (=> (not res!213982) (not e!229994))))

(assert (=> b!377878 (= res!213982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175869 mask!970))))

(assert (=> b!377878 (= lt!175869 (array!22066 (store (arr!10501 _keys!658) i!548 k0!778) (size!10854 _keys!658)))))

(declare-fun b!377879 () Bool)

(declare-fun res!213981 () Bool)

(assert (=> b!377879 (=> (not res!213981) (not e!229997))))

(assert (=> b!377879 (= res!213981 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5925))))

(declare-fun b!377880 () Bool)

(declare-fun e!229996 () Bool)

(assert (=> b!377880 (= e!229998 e!229996)))

(declare-fun res!213987 () Bool)

(assert (=> b!377880 (=> res!213987 e!229996)))

(assert (=> b!377880 (= res!213987 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175873 () ListLongMap!5001)

(assert (=> b!377880 (= lt!175876 lt!175873)))

(declare-fun lt!175877 () tuple2!6098)

(assert (=> b!377880 (= lt!175873 (+!884 lt!175879 lt!175877))))

(declare-fun lt!175880 () ListLongMap!5001)

(assert (=> b!377880 (= lt!175878 lt!175880)))

(assert (=> b!377880 (= lt!175880 (+!884 lt!175870 lt!175877))))

(assert (=> b!377880 (= lt!175876 (+!884 lt!175871 lt!175877))))

(assert (=> b!377880 (= lt!175877 (tuple2!6099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377881 () Bool)

(declare-fun e!230000 () Bool)

(declare-fun tp_is_empty!9079 () Bool)

(assert (=> b!377881 (= e!230000 tp_is_empty!9079)))

(declare-fun b!377882 () Bool)

(declare-fun res!213980 () Bool)

(assert (=> b!377882 (=> (not res!213980) (not e!229997))))

(assert (=> b!377882 (= res!213980 (and (= (size!10855 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10854 _keys!658) (size!10855 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377883 () Bool)

(assert (=> b!377883 (= e!229996 (bvsle #b00000000000000000000000000000000 (size!10854 _keys!658)))))

(assert (=> b!377883 (= lt!175873 (+!884 lt!175880 lt!175875))))

(declare-fun lt!175874 () Unit!11636)

(declare-fun addCommutativeForDiffKeys!289 (ListLongMap!5001 (_ BitVec 64) V!13211 (_ BitVec 64) V!13211) Unit!11636)

(assert (=> b!377883 (= lt!175874 (addCommutativeForDiffKeys!289 lt!175870 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15183 () Bool)

(declare-fun tp!30008 () Bool)

(assert (=> mapNonEmpty!15183 (= mapRes!15183 (and tp!30008 e!230000))))

(declare-fun mapRest!15183 () (Array (_ BitVec 32) ValueCell!4196))

(declare-fun mapValue!15183 () ValueCell!4196)

(declare-fun mapKey!15183 () (_ BitVec 32))

(assert (=> mapNonEmpty!15183 (= (arr!10502 _values!506) (store mapRest!15183 mapKey!15183 mapValue!15183))))

(declare-fun b!377874 () Bool)

(assert (=> b!377874 (= e!229999 tp_is_empty!9079)))

(declare-fun res!213986 () Bool)

(assert (=> start!37290 (=> (not res!213986) (not e!229997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37290 (= res!213986 (validMask!0 mask!970))))

(assert (=> start!37290 e!229997))

(declare-fun array_inv!7736 (array!22067) Bool)

(assert (=> start!37290 (and (array_inv!7736 _values!506) e!229993)))

(assert (=> start!37290 tp!30009))

(assert (=> start!37290 true))

(assert (=> start!37290 tp_is_empty!9079))

(declare-fun array_inv!7737 (array!22065) Bool)

(assert (=> start!37290 (array_inv!7737 _keys!658)))

(declare-fun b!377884 () Bool)

(declare-fun res!213979 () Bool)

(assert (=> b!377884 (=> (not res!213979) (not e!229997))))

(assert (=> b!377884 (= res!213979 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10854 _keys!658))))))

(declare-fun mapIsEmpty!15183 () Bool)

(assert (=> mapIsEmpty!15183 mapRes!15183))

(assert (= (and start!37290 res!213986) b!377882))

(assert (= (and b!377882 res!213980) b!377870))

(assert (= (and b!377870 res!213983) b!377879))

(assert (= (and b!377879 res!213981) b!377884))

(assert (= (and b!377884 res!213979) b!377872))

(assert (= (and b!377872 res!213984) b!377871))

(assert (= (and b!377871 res!213978) b!377877))

(assert (= (and b!377877 res!213989) b!377878))

(assert (= (and b!377878 res!213982) b!377875))

(assert (= (and b!377875 res!213988) b!377873))

(assert (= (and b!377873 (not res!213985)) b!377880))

(assert (= (and b!377880 (not res!213987)) b!377883))

(assert (= (and b!377876 condMapEmpty!15183) mapIsEmpty!15183))

(assert (= (and b!377876 (not condMapEmpty!15183)) mapNonEmpty!15183))

(get-info :version)

(assert (= (and mapNonEmpty!15183 ((_ is ValueCellFull!4196) mapValue!15183)) b!377881))

(assert (= (and b!377876 ((_ is ValueCellFull!4196) mapDefault!15183)) b!377874))

(assert (= start!37290 b!377876))

(declare-fun m!374231 () Bool)

(assert (=> b!377878 m!374231))

(declare-fun m!374233 () Bool)

(assert (=> b!377878 m!374233))

(declare-fun m!374235 () Bool)

(assert (=> b!377877 m!374235))

(declare-fun m!374237 () Bool)

(assert (=> b!377870 m!374237))

(declare-fun m!374239 () Bool)

(assert (=> b!377879 m!374239))

(declare-fun m!374241 () Bool)

(assert (=> b!377875 m!374241))

(declare-fun m!374243 () Bool)

(assert (=> b!377873 m!374243))

(declare-fun m!374245 () Bool)

(assert (=> b!377873 m!374245))

(declare-fun m!374247 () Bool)

(assert (=> b!377873 m!374247))

(declare-fun m!374249 () Bool)

(assert (=> b!377873 m!374249))

(declare-fun m!374251 () Bool)

(assert (=> b!377873 m!374251))

(declare-fun m!374253 () Bool)

(assert (=> b!377873 m!374253))

(declare-fun m!374255 () Bool)

(assert (=> b!377873 m!374255))

(declare-fun m!374257 () Bool)

(assert (=> mapNonEmpty!15183 m!374257))

(declare-fun m!374259 () Bool)

(assert (=> b!377872 m!374259))

(declare-fun m!374261 () Bool)

(assert (=> b!377880 m!374261))

(declare-fun m!374263 () Bool)

(assert (=> b!377880 m!374263))

(declare-fun m!374265 () Bool)

(assert (=> b!377880 m!374265))

(declare-fun m!374267 () Bool)

(assert (=> b!377883 m!374267))

(declare-fun m!374269 () Bool)

(assert (=> b!377883 m!374269))

(declare-fun m!374271 () Bool)

(assert (=> start!37290 m!374271))

(declare-fun m!374273 () Bool)

(assert (=> start!37290 m!374273))

(declare-fun m!374275 () Bool)

(assert (=> start!37290 m!374275))

(declare-fun m!374277 () Bool)

(assert (=> b!377871 m!374277))

(check-sat (not b!377870) (not b!377883) (not b!377872) b_and!15647 (not b!377877) (not b!377878) (not b!377875) (not start!37290) tp_is_empty!9079 (not b!377873) (not mapNonEmpty!15183) (not b!377880) (not b_next!8431) (not b!377879))
(check-sat b_and!15647 (not b_next!8431))
