; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39776 () Bool)

(assert start!39776)

(declare-fun b_free!10057 () Bool)

(declare-fun b_next!10057 () Bool)

(assert (=> start!39776 (= b_free!10057 (not b_next!10057))))

(declare-fun tp!35700 () Bool)

(declare-fun b_and!17787 () Bool)

(assert (=> start!39776 (= tp!35700 b_and!17787)))

(declare-fun b!428971 () Bool)

(declare-fun e!254133 () Bool)

(assert (=> b!428971 (= e!254133 true)))

(declare-datatypes ((array!26258 0))(
  ( (array!26259 (arr!12578 (Array (_ BitVec 32) (_ BitVec 64))) (size!12930 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26258)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!428971 (not (= (select (arr!12578 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12589 0))(
  ( (Unit!12590) )
))
(declare-fun lt!196074 () Unit!12589)

(declare-fun e!254137 () Unit!12589)

(assert (=> b!428971 (= lt!196074 e!254137)))

(declare-fun c!55398 () Bool)

(assert (=> b!428971 (= c!55398 (= (select (arr!12578 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16051 0))(
  ( (V!16052 (val!5649 Int)) )
))
(declare-datatypes ((tuple2!7334 0))(
  ( (tuple2!7335 (_1!3678 (_ BitVec 64)) (_2!3678 V!16051)) )
))
(declare-datatypes ((List!7335 0))(
  ( (Nil!7332) (Cons!7331 (h!8187 tuple2!7334) (t!12833 List!7335)) )
))
(declare-datatypes ((ListLongMap!6249 0))(
  ( (ListLongMap!6250 (toList!3140 List!7335)) )
))
(declare-fun lt!196067 () ListLongMap!6249)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!196072 () ListLongMap!6249)

(declare-datatypes ((ValueCell!5261 0))(
  ( (ValueCellFull!5261 (v!7897 V!16051)) (EmptyCell!5261) )
))
(declare-datatypes ((array!26260 0))(
  ( (array!26261 (arr!12579 (Array (_ BitVec 32) ValueCell!5261)) (size!12931 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26260)

(declare-fun +!1352 (ListLongMap!6249 tuple2!7334) ListLongMap!6249)

(declare-fun get!6239 (ValueCell!5261 V!16051) V!16051)

(declare-fun dynLambda!766 (Int (_ BitVec 64)) V!16051)

(assert (=> b!428971 (= lt!196067 (+!1352 lt!196072 (tuple2!7335 (select (arr!12578 _keys!709) from!863) (get!6239 (select (arr!12579 _values!549) from!863) (dynLambda!766 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428972 () Bool)

(declare-fun Unit!12591 () Unit!12589)

(assert (=> b!428972 (= e!254137 Unit!12591)))

(declare-fun b!428973 () Bool)

(declare-fun res!251907 () Bool)

(declare-fun e!254140 () Bool)

(assert (=> b!428973 (=> (not res!251907) (not e!254140))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26258 (_ BitVec 32)) Bool)

(assert (=> b!428973 (= res!251907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428974 () Bool)

(declare-fun res!251912 () Bool)

(assert (=> b!428974 (=> (not res!251912) (not e!254140))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428974 (= res!251912 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12930 _keys!709))))))

(declare-fun b!428975 () Bool)

(declare-fun e!254132 () Bool)

(assert (=> b!428975 (= e!254140 e!254132)))

(declare-fun res!251902 () Bool)

(assert (=> b!428975 (=> (not res!251902) (not e!254132))))

(declare-fun lt!196065 () array!26258)

(assert (=> b!428975 (= res!251902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196065 mask!1025))))

(assert (=> b!428975 (= lt!196065 (array!26259 (store (arr!12578 _keys!709) i!563 k0!794) (size!12930 _keys!709)))))

(declare-fun b!428976 () Bool)

(declare-fun res!251904 () Bool)

(assert (=> b!428976 (=> (not res!251904) (not e!254132))))

(assert (=> b!428976 (= res!251904 (bvsle from!863 i!563))))

(declare-fun b!428977 () Bool)

(declare-fun res!251905 () Bool)

(assert (=> b!428977 (=> (not res!251905) (not e!254140))))

(declare-fun arrayContainsKey!0 (array!26258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428977 (= res!251905 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428978 () Bool)

(declare-fun e!254134 () Bool)

(declare-fun e!254135 () Bool)

(declare-fun mapRes!18435 () Bool)

(assert (=> b!428978 (= e!254134 (and e!254135 mapRes!18435))))

(declare-fun condMapEmpty!18435 () Bool)

(declare-fun mapDefault!18435 () ValueCell!5261)

(assert (=> b!428978 (= condMapEmpty!18435 (= (arr!12579 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5261)) mapDefault!18435)))))

(declare-fun b!428979 () Bool)

(declare-fun tp_is_empty!11209 () Bool)

(assert (=> b!428979 (= e!254135 tp_is_empty!11209)))

(declare-fun res!251910 () Bool)

(assert (=> start!39776 (=> (not res!251910) (not e!254140))))

(assert (=> start!39776 (= res!251910 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12930 _keys!709))))))

(assert (=> start!39776 e!254140))

(assert (=> start!39776 tp_is_empty!11209))

(assert (=> start!39776 tp!35700))

(assert (=> start!39776 true))

(declare-fun array_inv!9226 (array!26260) Bool)

(assert (=> start!39776 (and (array_inv!9226 _values!549) e!254134)))

(declare-fun array_inv!9227 (array!26258) Bool)

(assert (=> start!39776 (array_inv!9227 _keys!709)))

(declare-fun mapIsEmpty!18435 () Bool)

(assert (=> mapIsEmpty!18435 mapRes!18435))

(declare-fun b!428980 () Bool)

(declare-fun res!251906 () Bool)

(assert (=> b!428980 (=> (not res!251906) (not e!254140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428980 (= res!251906 (validMask!0 mask!1025))))

(declare-fun b!428981 () Bool)

(declare-fun res!251911 () Bool)

(assert (=> b!428981 (=> (not res!251911) (not e!254140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428981 (= res!251911 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18435 () Bool)

(declare-fun tp!35699 () Bool)

(declare-fun e!254138 () Bool)

(assert (=> mapNonEmpty!18435 (= mapRes!18435 (and tp!35699 e!254138))))

(declare-fun mapValue!18435 () ValueCell!5261)

(declare-fun mapRest!18435 () (Array (_ BitVec 32) ValueCell!5261))

(declare-fun mapKey!18435 () (_ BitVec 32))

(assert (=> mapNonEmpty!18435 (= (arr!12579 _values!549) (store mapRest!18435 mapKey!18435 mapValue!18435))))

(declare-fun b!428982 () Bool)

(declare-fun res!251900 () Bool)

(assert (=> b!428982 (=> (not res!251900) (not e!254140))))

(assert (=> b!428982 (= res!251900 (or (= (select (arr!12578 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12578 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428983 () Bool)

(declare-fun res!251909 () Bool)

(assert (=> b!428983 (=> (not res!251909) (not e!254140))))

(declare-datatypes ((List!7336 0))(
  ( (Nil!7333) (Cons!7332 (h!8188 (_ BitVec 64)) (t!12834 List!7336)) )
))
(declare-fun arrayNoDuplicates!0 (array!26258 (_ BitVec 32) List!7336) Bool)

(assert (=> b!428983 (= res!251909 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7333))))

(declare-fun b!428984 () Bool)

(declare-fun Unit!12592 () Unit!12589)

(assert (=> b!428984 (= e!254137 Unit!12592)))

(declare-fun lt!196070 () Unit!12589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26258 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12589)

(assert (=> b!428984 (= lt!196070 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428984 false))

(declare-fun b!428985 () Bool)

(declare-fun e!254139 () Bool)

(assert (=> b!428985 (= e!254132 e!254139)))

(declare-fun res!251908 () Bool)

(assert (=> b!428985 (=> (not res!251908) (not e!254139))))

(assert (=> b!428985 (= res!251908 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16051)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16051)

(declare-fun lt!196066 () array!26260)

(declare-fun getCurrentListMapNoExtraKeys!1384 (array!26258 array!26260 (_ BitVec 32) (_ BitVec 32) V!16051 V!16051 (_ BitVec 32) Int) ListLongMap!6249)

(assert (=> b!428985 (= lt!196067 (getCurrentListMapNoExtraKeys!1384 lt!196065 lt!196066 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16051)

(assert (=> b!428985 (= lt!196066 (array!26261 (store (arr!12579 _values!549) i!563 (ValueCellFull!5261 v!412)) (size!12931 _values!549)))))

(declare-fun lt!196071 () ListLongMap!6249)

(assert (=> b!428985 (= lt!196071 (getCurrentListMapNoExtraKeys!1384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428986 () Bool)

(assert (=> b!428986 (= e!254139 (not e!254133))))

(declare-fun res!251901 () Bool)

(assert (=> b!428986 (=> res!251901 e!254133)))

(assert (=> b!428986 (= res!251901 (not (validKeyInArray!0 (select (arr!12578 _keys!709) from!863))))))

(declare-fun lt!196069 () ListLongMap!6249)

(assert (=> b!428986 (= lt!196069 lt!196072)))

(declare-fun lt!196073 () ListLongMap!6249)

(assert (=> b!428986 (= lt!196072 (+!1352 lt!196073 (tuple2!7335 k0!794 v!412)))))

(assert (=> b!428986 (= lt!196069 (getCurrentListMapNoExtraKeys!1384 lt!196065 lt!196066 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428986 (= lt!196073 (getCurrentListMapNoExtraKeys!1384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196068 () Unit!12589)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!533 (array!26258 array!26260 (_ BitVec 32) (_ BitVec 32) V!16051 V!16051 (_ BitVec 32) (_ BitVec 64) V!16051 (_ BitVec 32) Int) Unit!12589)

(assert (=> b!428986 (= lt!196068 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428987 () Bool)

(assert (=> b!428987 (= e!254138 tp_is_empty!11209)))

(declare-fun b!428988 () Bool)

(declare-fun res!251913 () Bool)

(assert (=> b!428988 (=> (not res!251913) (not e!254132))))

(assert (=> b!428988 (= res!251913 (arrayNoDuplicates!0 lt!196065 #b00000000000000000000000000000000 Nil!7333))))

(declare-fun b!428989 () Bool)

(declare-fun res!251903 () Bool)

(assert (=> b!428989 (=> (not res!251903) (not e!254140))))

(assert (=> b!428989 (= res!251903 (and (= (size!12931 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12930 _keys!709) (size!12931 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39776 res!251910) b!428980))

(assert (= (and b!428980 res!251906) b!428989))

(assert (= (and b!428989 res!251903) b!428973))

(assert (= (and b!428973 res!251907) b!428983))

(assert (= (and b!428983 res!251909) b!428974))

(assert (= (and b!428974 res!251912) b!428981))

(assert (= (and b!428981 res!251911) b!428982))

(assert (= (and b!428982 res!251900) b!428977))

(assert (= (and b!428977 res!251905) b!428975))

(assert (= (and b!428975 res!251902) b!428988))

(assert (= (and b!428988 res!251913) b!428976))

(assert (= (and b!428976 res!251904) b!428985))

(assert (= (and b!428985 res!251908) b!428986))

(assert (= (and b!428986 (not res!251901)) b!428971))

(assert (= (and b!428971 c!55398) b!428984))

(assert (= (and b!428971 (not c!55398)) b!428972))

(assert (= (and b!428978 condMapEmpty!18435) mapIsEmpty!18435))

(assert (= (and b!428978 (not condMapEmpty!18435)) mapNonEmpty!18435))

(get-info :version)

(assert (= (and mapNonEmpty!18435 ((_ is ValueCellFull!5261) mapValue!18435)) b!428987))

(assert (= (and b!428978 ((_ is ValueCellFull!5261) mapDefault!18435)) b!428979))

(assert (= start!39776 b!428978))

(declare-fun b_lambda!9167 () Bool)

(assert (=> (not b_lambda!9167) (not b!428971)))

(declare-fun t!12832 () Bool)

(declare-fun tb!3455 () Bool)

(assert (=> (and start!39776 (= defaultEntry!557 defaultEntry!557) t!12832) tb!3455))

(declare-fun result!6445 () Bool)

(assert (=> tb!3455 (= result!6445 tp_is_empty!11209)))

(assert (=> b!428971 t!12832))

(declare-fun b_and!17789 () Bool)

(assert (= b_and!17787 (and (=> t!12832 result!6445) b_and!17789)))

(declare-fun m!417599 () Bool)

(assert (=> b!428982 m!417599))

(declare-fun m!417601 () Bool)

(assert (=> b!428983 m!417601))

(declare-fun m!417603 () Bool)

(assert (=> b!428975 m!417603))

(declare-fun m!417605 () Bool)

(assert (=> b!428975 m!417605))

(declare-fun m!417607 () Bool)

(assert (=> b!428973 m!417607))

(declare-fun m!417609 () Bool)

(assert (=> b!428985 m!417609))

(declare-fun m!417611 () Bool)

(assert (=> b!428985 m!417611))

(declare-fun m!417613 () Bool)

(assert (=> b!428985 m!417613))

(declare-fun m!417615 () Bool)

(assert (=> b!428971 m!417615))

(declare-fun m!417617 () Bool)

(assert (=> b!428971 m!417617))

(declare-fun m!417619 () Bool)

(assert (=> b!428971 m!417619))

(declare-fun m!417621 () Bool)

(assert (=> b!428971 m!417621))

(assert (=> b!428971 m!417621))

(assert (=> b!428971 m!417617))

(declare-fun m!417623 () Bool)

(assert (=> b!428971 m!417623))

(declare-fun m!417625 () Bool)

(assert (=> b!428988 m!417625))

(declare-fun m!417627 () Bool)

(assert (=> start!39776 m!417627))

(declare-fun m!417629 () Bool)

(assert (=> start!39776 m!417629))

(declare-fun m!417631 () Bool)

(assert (=> mapNonEmpty!18435 m!417631))

(declare-fun m!417633 () Bool)

(assert (=> b!428977 m!417633))

(declare-fun m!417635 () Bool)

(assert (=> b!428980 m!417635))

(declare-fun m!417637 () Bool)

(assert (=> b!428984 m!417637))

(assert (=> b!428986 m!417615))

(declare-fun m!417639 () Bool)

(assert (=> b!428986 m!417639))

(declare-fun m!417641 () Bool)

(assert (=> b!428986 m!417641))

(assert (=> b!428986 m!417615))

(declare-fun m!417643 () Bool)

(assert (=> b!428986 m!417643))

(declare-fun m!417645 () Bool)

(assert (=> b!428986 m!417645))

(declare-fun m!417647 () Bool)

(assert (=> b!428986 m!417647))

(declare-fun m!417649 () Bool)

(assert (=> b!428981 m!417649))

(check-sat (not b!428986) (not start!39776) (not mapNonEmpty!18435) (not b!428981) tp_is_empty!11209 (not b!428988) (not b_next!10057) (not b!428977) (not b!428984) (not b!428983) (not b!428971) (not b!428975) b_and!17789 (not b!428985) (not b_lambda!9167) (not b!428973) (not b!428980))
(check-sat b_and!17789 (not b_next!10057))
