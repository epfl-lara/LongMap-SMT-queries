; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41060 () Bool)

(assert start!41060)

(declare-fun b_free!10987 () Bool)

(declare-fun b_next!10987 () Bool)

(assert (=> start!41060 (= b_free!10987 (not b_next!10987))))

(declare-fun tp!38791 () Bool)

(declare-fun b_and!19155 () Bool)

(assert (=> start!41060 (= tp!38791 b_and!19155)))

(declare-fun res!273609 () Bool)

(declare-fun e!267345 () Bool)

(assert (=> start!41060 (=> (not res!273609) (not e!267345))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28443 0))(
  ( (array!28444 (arr!13664 (Array (_ BitVec 32) (_ BitVec 64))) (size!14017 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28443)

(assert (=> start!41060 (= res!273609 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14017 _keys!709))))))

(assert (=> start!41060 e!267345))

(declare-fun tp_is_empty!12325 () Bool)

(assert (=> start!41060 tp_is_empty!12325))

(assert (=> start!41060 tp!38791))

(assert (=> start!41060 true))

(declare-datatypes ((V!17539 0))(
  ( (V!17540 (val!6207 Int)) )
))
(declare-datatypes ((ValueCell!5819 0))(
  ( (ValueCellFull!5819 (v!8471 V!17539)) (EmptyCell!5819) )
))
(declare-datatypes ((array!28445 0))(
  ( (array!28446 (arr!13665 (Array (_ BitVec 32) ValueCell!5819)) (size!14018 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28445)

(declare-fun e!267346 () Bool)

(declare-fun array_inv!9952 (array!28445) Bool)

(assert (=> start!41060 (and (array_inv!9952 _values!549) e!267346)))

(declare-fun array_inv!9953 (array!28443) Bool)

(assert (=> start!41060 (array_inv!9953 _keys!709)))

(declare-fun b!457926 () Bool)

(declare-fun e!267348 () Bool)

(assert (=> b!457926 (= e!267345 e!267348)))

(declare-fun res!273605 () Bool)

(assert (=> b!457926 (=> (not res!273605) (not e!267348))))

(declare-fun lt!207026 () array!28443)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28443 (_ BitVec 32)) Bool)

(assert (=> b!457926 (= res!273605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207026 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457926 (= lt!207026 (array!28444 (store (arr!13664 _keys!709) i!563 k0!794) (size!14017 _keys!709)))))

(declare-fun b!457927 () Bool)

(declare-fun res!273606 () Bool)

(assert (=> b!457927 (=> (not res!273606) (not e!267348))))

(declare-datatypes ((List!8270 0))(
  ( (Nil!8267) (Cons!8266 (h!9122 (_ BitVec 64)) (t!14127 List!8270)) )
))
(declare-fun arrayNoDuplicates!0 (array!28443 (_ BitVec 32) List!8270) Bool)

(assert (=> b!457927 (= res!273606 (arrayNoDuplicates!0 lt!207026 #b00000000000000000000000000000000 Nil!8267))))

(declare-fun b!457928 () Bool)

(declare-fun e!267342 () Bool)

(declare-fun e!267347 () Bool)

(assert (=> b!457928 (= e!267342 (not e!267347))))

(declare-fun res!273596 () Bool)

(assert (=> b!457928 (=> res!273596 e!267347)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457928 (= res!273596 (not (validKeyInArray!0 (select (arr!13664 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8206 0))(
  ( (tuple2!8207 (_1!4114 (_ BitVec 64)) (_2!4114 V!17539)) )
))
(declare-datatypes ((List!8271 0))(
  ( (Nil!8268) (Cons!8267 (h!9123 tuple2!8206) (t!14128 List!8271)) )
))
(declare-datatypes ((ListLongMap!7109 0))(
  ( (ListLongMap!7110 (toList!3570 List!8271)) )
))
(declare-fun lt!207023 () ListLongMap!7109)

(declare-fun lt!207028 () ListLongMap!7109)

(assert (=> b!457928 (= lt!207023 lt!207028)))

(declare-fun lt!207029 () ListLongMap!7109)

(declare-fun v!412 () V!17539)

(declare-fun +!1624 (ListLongMap!7109 tuple2!8206) ListLongMap!7109)

(assert (=> b!457928 (= lt!207028 (+!1624 lt!207029 (tuple2!8207 k0!794 v!412)))))

(declare-fun minValue!515 () V!17539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!207025 () array!28445)

(declare-fun zeroValue!515 () V!17539)

(declare-fun getCurrentListMapNoExtraKeys!1764 (array!28443 array!28445 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) Int) ListLongMap!7109)

(assert (=> b!457928 (= lt!207023 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457928 (= lt!207029 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13291 0))(
  ( (Unit!13292) )
))
(declare-fun lt!207027 () Unit!13291)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 (array!28443 array!28445 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) (_ BitVec 64) V!17539 (_ BitVec 32) Int) Unit!13291)

(assert (=> b!457928 (= lt!207027 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457929 () Bool)

(assert (=> b!457929 (= e!267348 e!267342)))

(declare-fun res!273604 () Bool)

(assert (=> b!457929 (=> (not res!273604) (not e!267342))))

(assert (=> b!457929 (= res!273604 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207030 () ListLongMap!7109)

(assert (=> b!457929 (= lt!207030 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457929 (= lt!207025 (array!28446 (store (arr!13665 _values!549) i!563 (ValueCellFull!5819 v!412)) (size!14018 _values!549)))))

(declare-fun lt!207024 () ListLongMap!7109)

(assert (=> b!457929 (= lt!207024 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457930 () Bool)

(declare-fun res!273603 () Bool)

(assert (=> b!457930 (=> (not res!273603) (not e!267345))))

(assert (=> b!457930 (= res!273603 (validKeyInArray!0 k0!794))))

(declare-fun b!457931 () Bool)

(assert (=> b!457931 (= e!267347 (or (not (= (select (arr!13664 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14017 _keys!709)) (bvslt (size!14017 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun get!6734 (ValueCell!5819 V!17539) V!17539)

(declare-fun dynLambda!885 (Int (_ BitVec 64)) V!17539)

(assert (=> b!457931 (= lt!207030 (+!1624 lt!207028 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457932 () Bool)

(declare-fun res!273598 () Bool)

(assert (=> b!457932 (=> (not res!273598) (not e!267345))))

(assert (=> b!457932 (= res!273598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20131 () Bool)

(declare-fun mapRes!20131 () Bool)

(declare-fun tp!38790 () Bool)

(declare-fun e!267343 () Bool)

(assert (=> mapNonEmpty!20131 (= mapRes!20131 (and tp!38790 e!267343))))

(declare-fun mapRest!20131 () (Array (_ BitVec 32) ValueCell!5819))

(declare-fun mapKey!20131 () (_ BitVec 32))

(declare-fun mapValue!20131 () ValueCell!5819)

(assert (=> mapNonEmpty!20131 (= (arr!13665 _values!549) (store mapRest!20131 mapKey!20131 mapValue!20131))))

(declare-fun b!457933 () Bool)

(declare-fun res!273601 () Bool)

(assert (=> b!457933 (=> (not res!273601) (not e!267345))))

(assert (=> b!457933 (= res!273601 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14017 _keys!709))))))

(declare-fun b!457934 () Bool)

(declare-fun e!267341 () Bool)

(assert (=> b!457934 (= e!267346 (and e!267341 mapRes!20131))))

(declare-fun condMapEmpty!20131 () Bool)

(declare-fun mapDefault!20131 () ValueCell!5819)

(assert (=> b!457934 (= condMapEmpty!20131 (= (arr!13665 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5819)) mapDefault!20131)))))

(declare-fun b!457935 () Bool)

(assert (=> b!457935 (= e!267343 tp_is_empty!12325)))

(declare-fun b!457936 () Bool)

(declare-fun res!273602 () Bool)

(assert (=> b!457936 (=> (not res!273602) (not e!267348))))

(assert (=> b!457936 (= res!273602 (bvsle from!863 i!563))))

(declare-fun b!457937 () Bool)

(declare-fun res!273597 () Bool)

(assert (=> b!457937 (=> (not res!273597) (not e!267345))))

(declare-fun arrayContainsKey!0 (array!28443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457937 (= res!273597 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457938 () Bool)

(declare-fun res!273608 () Bool)

(assert (=> b!457938 (=> (not res!273608) (not e!267345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457938 (= res!273608 (validMask!0 mask!1025))))

(declare-fun b!457939 () Bool)

(declare-fun res!273607 () Bool)

(assert (=> b!457939 (=> (not res!273607) (not e!267345))))

(assert (=> b!457939 (= res!273607 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8267))))

(declare-fun b!457940 () Bool)

(declare-fun res!273600 () Bool)

(assert (=> b!457940 (=> (not res!273600) (not e!267345))))

(assert (=> b!457940 (= res!273600 (or (= (select (arr!13664 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13664 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457941 () Bool)

(assert (=> b!457941 (= e!267341 tp_is_empty!12325)))

(declare-fun b!457942 () Bool)

(declare-fun res!273599 () Bool)

(assert (=> b!457942 (=> (not res!273599) (not e!267345))))

(assert (=> b!457942 (= res!273599 (and (= (size!14018 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14017 _keys!709) (size!14018 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20131 () Bool)

(assert (=> mapIsEmpty!20131 mapRes!20131))

(assert (= (and start!41060 res!273609) b!457938))

(assert (= (and b!457938 res!273608) b!457942))

(assert (= (and b!457942 res!273599) b!457932))

(assert (= (and b!457932 res!273598) b!457939))

(assert (= (and b!457939 res!273607) b!457933))

(assert (= (and b!457933 res!273601) b!457930))

(assert (= (and b!457930 res!273603) b!457940))

(assert (= (and b!457940 res!273600) b!457937))

(assert (= (and b!457937 res!273597) b!457926))

(assert (= (and b!457926 res!273605) b!457927))

(assert (= (and b!457927 res!273606) b!457936))

(assert (= (and b!457936 res!273602) b!457929))

(assert (= (and b!457929 res!273604) b!457928))

(assert (= (and b!457928 (not res!273596)) b!457931))

(assert (= (and b!457934 condMapEmpty!20131) mapIsEmpty!20131))

(assert (= (and b!457934 (not condMapEmpty!20131)) mapNonEmpty!20131))

(get-info :version)

(assert (= (and mapNonEmpty!20131 ((_ is ValueCellFull!5819) mapValue!20131)) b!457935))

(assert (= (and b!457934 ((_ is ValueCellFull!5819) mapDefault!20131)) b!457941))

(assert (= start!41060 b!457934))

(declare-fun b_lambda!9735 () Bool)

(assert (=> (not b_lambda!9735) (not b!457931)))

(declare-fun t!14126 () Bool)

(declare-fun tb!3815 () Bool)

(assert (=> (and start!41060 (= defaultEntry!557 defaultEntry!557) t!14126) tb!3815))

(declare-fun result!7179 () Bool)

(assert (=> tb!3815 (= result!7179 tp_is_empty!12325)))

(assert (=> b!457931 t!14126))

(declare-fun b_and!19157 () Bool)

(assert (= b_and!19155 (and (=> t!14126 result!7179) b_and!19157)))

(declare-fun m!440777 () Bool)

(assert (=> b!457937 m!440777))

(declare-fun m!440779 () Bool)

(assert (=> b!457939 m!440779))

(declare-fun m!440781 () Bool)

(assert (=> b!457929 m!440781))

(declare-fun m!440783 () Bool)

(assert (=> b!457929 m!440783))

(declare-fun m!440785 () Bool)

(assert (=> b!457929 m!440785))

(declare-fun m!440787 () Bool)

(assert (=> mapNonEmpty!20131 m!440787))

(declare-fun m!440789 () Bool)

(assert (=> b!457927 m!440789))

(declare-fun m!440791 () Bool)

(assert (=> b!457926 m!440791))

(declare-fun m!440793 () Bool)

(assert (=> b!457926 m!440793))

(declare-fun m!440795 () Bool)

(assert (=> b!457931 m!440795))

(declare-fun m!440797 () Bool)

(assert (=> b!457931 m!440797))

(declare-fun m!440799 () Bool)

(assert (=> b!457931 m!440799))

(assert (=> b!457931 m!440799))

(assert (=> b!457931 m!440797))

(declare-fun m!440801 () Bool)

(assert (=> b!457931 m!440801))

(declare-fun m!440803 () Bool)

(assert (=> b!457931 m!440803))

(declare-fun m!440805 () Bool)

(assert (=> b!457932 m!440805))

(declare-fun m!440807 () Bool)

(assert (=> b!457940 m!440807))

(declare-fun m!440809 () Bool)

(assert (=> b!457930 m!440809))

(declare-fun m!440811 () Bool)

(assert (=> b!457938 m!440811))

(declare-fun m!440813 () Bool)

(assert (=> start!41060 m!440813))

(declare-fun m!440815 () Bool)

(assert (=> start!41060 m!440815))

(assert (=> b!457928 m!440795))

(declare-fun m!440817 () Bool)

(assert (=> b!457928 m!440817))

(declare-fun m!440819 () Bool)

(assert (=> b!457928 m!440819))

(declare-fun m!440821 () Bool)

(assert (=> b!457928 m!440821))

(assert (=> b!457928 m!440795))

(declare-fun m!440823 () Bool)

(assert (=> b!457928 m!440823))

(declare-fun m!440825 () Bool)

(assert (=> b!457928 m!440825))

(check-sat b_and!19157 (not b!457932) (not b!457930) (not b_next!10987) (not b!457927) (not mapNonEmpty!20131) (not b!457928) (not b!457931) (not b!457937) tp_is_empty!12325 (not b!457926) (not b!457938) (not b!457939) (not b!457929) (not start!41060) (not b_lambda!9735))
(check-sat b_and!19157 (not b_next!10987))
(get-model)

(declare-fun b_lambda!9741 () Bool)

(assert (= b_lambda!9735 (or (and start!41060 b_free!10987) b_lambda!9741)))

(check-sat b_and!19157 (not b!457932) (not b!457930) (not b_next!10987) (not b!457927) (not mapNonEmpty!20131) (not start!41060) (not b!457928) (not b_lambda!9741) (not b!457931) (not b!457937) tp_is_empty!12325 (not b!457926) (not b!457938) (not b!457939) (not b!457929))
(check-sat b_and!19157 (not b_next!10987))
(get-model)

(declare-fun b!458059 () Bool)

(declare-fun e!267404 () Bool)

(declare-fun e!267403 () Bool)

(assert (=> b!458059 (= e!267404 e!267403)))

(declare-fun lt!207085 () (_ BitVec 64))

(assert (=> b!458059 (= lt!207085 (select (arr!13664 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207087 () Unit!13291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28443 (_ BitVec 64) (_ BitVec 32)) Unit!13291)

(assert (=> b!458059 (= lt!207087 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207085 #b00000000000000000000000000000000))))

(assert (=> b!458059 (arrayContainsKey!0 _keys!709 lt!207085 #b00000000000000000000000000000000)))

(declare-fun lt!207086 () Unit!13291)

(assert (=> b!458059 (= lt!207086 lt!207087)))

(declare-fun res!273698 () Bool)

(declare-datatypes ((SeekEntryResult!3529 0))(
  ( (MissingZero!3529 (index!16295 (_ BitVec 32))) (Found!3529 (index!16296 (_ BitVec 32))) (Intermediate!3529 (undefined!4341 Bool) (index!16297 (_ BitVec 32)) (x!42769 (_ BitVec 32))) (Undefined!3529) (MissingVacant!3529 (index!16298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28443 (_ BitVec 32)) SeekEntryResult!3529)

(assert (=> b!458059 (= res!273698 (= (seekEntryOrOpen!0 (select (arr!13664 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3529 #b00000000000000000000000000000000)))))

(assert (=> b!458059 (=> (not res!273698) (not e!267403))))

(declare-fun b!458060 () Bool)

(declare-fun call!30089 () Bool)

(assert (=> b!458060 (= e!267404 call!30089)))

(declare-fun b!458061 () Bool)

(assert (=> b!458061 (= e!267403 call!30089)))

(declare-fun bm!30086 () Bool)

(assert (=> bm!30086 (= call!30089 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!458062 () Bool)

(declare-fun e!267405 () Bool)

(assert (=> b!458062 (= e!267405 e!267404)))

(declare-fun c!56309 () Bool)

(assert (=> b!458062 (= c!56309 (validKeyInArray!0 (select (arr!13664 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74507 () Bool)

(declare-fun res!273699 () Bool)

(assert (=> d!74507 (=> res!273699 e!267405)))

(assert (=> d!74507 (= res!273699 (bvsge #b00000000000000000000000000000000 (size!14017 _keys!709)))))

(assert (=> d!74507 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267405)))

(assert (= (and d!74507 (not res!273699)) b!458062))

(assert (= (and b!458062 c!56309) b!458059))

(assert (= (and b!458062 (not c!56309)) b!458060))

(assert (= (and b!458059 res!273698) b!458061))

(assert (= (or b!458061 b!458060) bm!30086))

(declare-fun m!440927 () Bool)

(assert (=> b!458059 m!440927))

(declare-fun m!440929 () Bool)

(assert (=> b!458059 m!440929))

(declare-fun m!440931 () Bool)

(assert (=> b!458059 m!440931))

(assert (=> b!458059 m!440927))

(declare-fun m!440933 () Bool)

(assert (=> b!458059 m!440933))

(declare-fun m!440935 () Bool)

(assert (=> bm!30086 m!440935))

(assert (=> b!458062 m!440927))

(assert (=> b!458062 m!440927))

(declare-fun m!440937 () Bool)

(assert (=> b!458062 m!440937))

(assert (=> b!457932 d!74507))

(declare-fun b!458073 () Bool)

(declare-fun e!267417 () Bool)

(declare-fun contains!2492 (List!8270 (_ BitVec 64)) Bool)

(assert (=> b!458073 (= e!267417 (contains!2492 Nil!8267 (select (arr!13664 lt!207026) #b00000000000000000000000000000000)))))

(declare-fun b!458074 () Bool)

(declare-fun e!267416 () Bool)

(declare-fun call!30092 () Bool)

(assert (=> b!458074 (= e!267416 call!30092)))

(declare-fun b!458075 () Bool)

(declare-fun e!267414 () Bool)

(assert (=> b!458075 (= e!267414 e!267416)))

(declare-fun c!56312 () Bool)

(assert (=> b!458075 (= c!56312 (validKeyInArray!0 (select (arr!13664 lt!207026) #b00000000000000000000000000000000)))))

(declare-fun bm!30089 () Bool)

(assert (=> bm!30089 (= call!30092 (arrayNoDuplicates!0 lt!207026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56312 (Cons!8266 (select (arr!13664 lt!207026) #b00000000000000000000000000000000) Nil!8267) Nil!8267)))))

(declare-fun b!458076 () Bool)

(declare-fun e!267415 () Bool)

(assert (=> b!458076 (= e!267415 e!267414)))

(declare-fun res!273707 () Bool)

(assert (=> b!458076 (=> (not res!273707) (not e!267414))))

(assert (=> b!458076 (= res!273707 (not e!267417))))

(declare-fun res!273706 () Bool)

(assert (=> b!458076 (=> (not res!273706) (not e!267417))))

(assert (=> b!458076 (= res!273706 (validKeyInArray!0 (select (arr!13664 lt!207026) #b00000000000000000000000000000000)))))

(declare-fun d!74509 () Bool)

(declare-fun res!273708 () Bool)

(assert (=> d!74509 (=> res!273708 e!267415)))

(assert (=> d!74509 (= res!273708 (bvsge #b00000000000000000000000000000000 (size!14017 lt!207026)))))

(assert (=> d!74509 (= (arrayNoDuplicates!0 lt!207026 #b00000000000000000000000000000000 Nil!8267) e!267415)))

(declare-fun b!458077 () Bool)

(assert (=> b!458077 (= e!267416 call!30092)))

(assert (= (and d!74509 (not res!273708)) b!458076))

(assert (= (and b!458076 res!273706) b!458073))

(assert (= (and b!458076 res!273707) b!458075))

(assert (= (and b!458075 c!56312) b!458077))

(assert (= (and b!458075 (not c!56312)) b!458074))

(assert (= (or b!458077 b!458074) bm!30089))

(declare-fun m!440939 () Bool)

(assert (=> b!458073 m!440939))

(assert (=> b!458073 m!440939))

(declare-fun m!440941 () Bool)

(assert (=> b!458073 m!440941))

(assert (=> b!458075 m!440939))

(assert (=> b!458075 m!440939))

(declare-fun m!440943 () Bool)

(assert (=> b!458075 m!440943))

(assert (=> bm!30089 m!440939))

(declare-fun m!440945 () Bool)

(assert (=> bm!30089 m!440945))

(assert (=> b!458076 m!440939))

(assert (=> b!458076 m!440939))

(assert (=> b!458076 m!440943))

(assert (=> b!457927 d!74509))

(declare-fun d!74511 () Bool)

(declare-fun res!273713 () Bool)

(declare-fun e!267422 () Bool)

(assert (=> d!74511 (=> res!273713 e!267422)))

(assert (=> d!74511 (= res!273713 (= (select (arr!13664 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74511 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267422)))

(declare-fun b!458082 () Bool)

(declare-fun e!267423 () Bool)

(assert (=> b!458082 (= e!267422 e!267423)))

(declare-fun res!273714 () Bool)

(assert (=> b!458082 (=> (not res!273714) (not e!267423))))

(assert (=> b!458082 (= res!273714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14017 _keys!709)))))

(declare-fun b!458083 () Bool)

(assert (=> b!458083 (= e!267423 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74511 (not res!273713)) b!458082))

(assert (= (and b!458082 res!273714) b!458083))

(assert (=> d!74511 m!440927))

(declare-fun m!440947 () Bool)

(assert (=> b!458083 m!440947))

(assert (=> b!457937 d!74511))

(declare-fun e!267442 () Bool)

(declare-fun lt!207107 () ListLongMap!7109)

(declare-fun b!458108 () Bool)

(assert (=> b!458108 (= e!267442 (= lt!207107 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30092 () Bool)

(declare-fun call!30095 () ListLongMap!7109)

(assert (=> bm!30092 (= call!30095 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458109 () Bool)

(declare-fun e!267441 () Bool)

(declare-fun e!267443 () Bool)

(assert (=> b!458109 (= e!267441 e!267443)))

(declare-fun c!56323 () Bool)

(declare-fun e!267444 () Bool)

(assert (=> b!458109 (= c!56323 e!267444)))

(declare-fun res!273724 () Bool)

(assert (=> b!458109 (=> (not res!273724) (not e!267444))))

(assert (=> b!458109 (= res!273724 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(declare-fun b!458111 () Bool)

(declare-fun e!267439 () ListLongMap!7109)

(declare-fun e!267438 () ListLongMap!7109)

(assert (=> b!458111 (= e!267439 e!267438)))

(declare-fun c!56322 () Bool)

(assert (=> b!458111 (= c!56322 (validKeyInArray!0 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458112 () Bool)

(declare-fun lt!207103 () Unit!13291)

(declare-fun lt!207108 () Unit!13291)

(assert (=> b!458112 (= lt!207103 lt!207108)))

(declare-fun lt!207106 () V!17539)

(declare-fun lt!207105 () (_ BitVec 64))

(declare-fun lt!207102 () ListLongMap!7109)

(declare-fun lt!207104 () (_ BitVec 64))

(declare-fun contains!2493 (ListLongMap!7109 (_ BitVec 64)) Bool)

(assert (=> b!458112 (not (contains!2493 (+!1624 lt!207102 (tuple2!8207 lt!207104 lt!207106)) lt!207105))))

(declare-fun addStillNotContains!149 (ListLongMap!7109 (_ BitVec 64) V!17539 (_ BitVec 64)) Unit!13291)

(assert (=> b!458112 (= lt!207108 (addStillNotContains!149 lt!207102 lt!207104 lt!207106 lt!207105))))

(assert (=> b!458112 (= lt!207105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458112 (= lt!207106 (get!6734 (select (arr!13665 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458112 (= lt!207104 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458112 (= lt!207102 call!30095)))

(assert (=> b!458112 (= e!267438 (+!1624 call!30095 (tuple2!8207 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6734 (select (arr!13665 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458113 () Bool)

(assert (=> b!458113 (= e!267444 (validKeyInArray!0 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458113 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458114 () Bool)

(assert (=> b!458114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(assert (=> b!458114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14018 _values!549)))))

(declare-fun e!267440 () Bool)

(declare-fun apply!315 (ListLongMap!7109 (_ BitVec 64)) V!17539)

(assert (=> b!458114 (= e!267440 (= (apply!315 lt!207107 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6734 (select (arr!13665 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458115 () Bool)

(assert (=> b!458115 (= e!267443 e!267442)))

(declare-fun c!56321 () Bool)

(assert (=> b!458115 (= c!56321 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(declare-fun b!458116 () Bool)

(declare-fun isEmpty!566 (ListLongMap!7109) Bool)

(assert (=> b!458116 (= e!267442 (isEmpty!566 lt!207107))))

(declare-fun b!458117 () Bool)

(declare-fun res!273725 () Bool)

(assert (=> b!458117 (=> (not res!273725) (not e!267441))))

(assert (=> b!458117 (= res!273725 (not (contains!2493 lt!207107 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458110 () Bool)

(assert (=> b!458110 (= e!267443 e!267440)))

(assert (=> b!458110 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(declare-fun res!273726 () Bool)

(assert (=> b!458110 (= res!273726 (contains!2493 lt!207107 (select (arr!13664 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458110 (=> (not res!273726) (not e!267440))))

(declare-fun d!74513 () Bool)

(assert (=> d!74513 e!267441))

(declare-fun res!273723 () Bool)

(assert (=> d!74513 (=> (not res!273723) (not e!267441))))

(assert (=> d!74513 (= res!273723 (not (contains!2493 lt!207107 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74513 (= lt!207107 e!267439)))

(declare-fun c!56324 () Bool)

(assert (=> d!74513 (= c!56324 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(assert (=> d!74513 (validMask!0 mask!1025)))

(assert (=> d!74513 (= (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207107)))

(declare-fun b!458118 () Bool)

(assert (=> b!458118 (= e!267438 call!30095)))

(declare-fun b!458119 () Bool)

(assert (=> b!458119 (= e!267439 (ListLongMap!7110 Nil!8268))))

(assert (= (and d!74513 c!56324) b!458119))

(assert (= (and d!74513 (not c!56324)) b!458111))

(assert (= (and b!458111 c!56322) b!458112))

(assert (= (and b!458111 (not c!56322)) b!458118))

(assert (= (or b!458112 b!458118) bm!30092))

(assert (= (and d!74513 res!273723) b!458117))

(assert (= (and b!458117 res!273725) b!458109))

(assert (= (and b!458109 res!273724) b!458113))

(assert (= (and b!458109 c!56323) b!458110))

(assert (= (and b!458109 (not c!56323)) b!458115))

(assert (= (and b!458110 res!273726) b!458114))

(assert (= (and b!458115 c!56321) b!458108))

(assert (= (and b!458115 (not c!56321)) b!458116))

(declare-fun b_lambda!9743 () Bool)

(assert (=> (not b_lambda!9743) (not b!458112)))

(assert (=> b!458112 t!14126))

(declare-fun b_and!19167 () Bool)

(assert (= b_and!19157 (and (=> t!14126 result!7179) b_and!19167)))

(declare-fun b_lambda!9745 () Bool)

(assert (=> (not b_lambda!9745) (not b!458114)))

(assert (=> b!458114 t!14126))

(declare-fun b_and!19169 () Bool)

(assert (= b_and!19167 (and (=> t!14126 result!7179) b_and!19169)))

(declare-fun m!440949 () Bool)

(assert (=> b!458111 m!440949))

(assert (=> b!458111 m!440949))

(declare-fun m!440951 () Bool)

(assert (=> b!458111 m!440951))

(assert (=> b!458110 m!440949))

(assert (=> b!458110 m!440949))

(declare-fun m!440953 () Bool)

(assert (=> b!458110 m!440953))

(declare-fun m!440955 () Bool)

(assert (=> b!458108 m!440955))

(declare-fun m!440957 () Bool)

(assert (=> b!458114 m!440957))

(assert (=> b!458114 m!440797))

(declare-fun m!440959 () Bool)

(assert (=> b!458114 m!440959))

(assert (=> b!458114 m!440957))

(assert (=> b!458114 m!440949))

(assert (=> b!458114 m!440949))

(declare-fun m!440961 () Bool)

(assert (=> b!458114 m!440961))

(assert (=> b!458114 m!440797))

(assert (=> b!458113 m!440949))

(assert (=> b!458113 m!440949))

(assert (=> b!458113 m!440951))

(declare-fun m!440963 () Bool)

(assert (=> b!458117 m!440963))

(assert (=> bm!30092 m!440955))

(declare-fun m!440965 () Bool)

(assert (=> b!458116 m!440965))

(assert (=> b!458112 m!440957))

(assert (=> b!458112 m!440797))

(assert (=> b!458112 m!440959))

(assert (=> b!458112 m!440949))

(declare-fun m!440967 () Bool)

(assert (=> b!458112 m!440967))

(declare-fun m!440969 () Bool)

(assert (=> b!458112 m!440969))

(assert (=> b!458112 m!440797))

(assert (=> b!458112 m!440957))

(declare-fun m!440971 () Bool)

(assert (=> b!458112 m!440971))

(declare-fun m!440973 () Bool)

(assert (=> b!458112 m!440973))

(assert (=> b!458112 m!440967))

(declare-fun m!440975 () Bool)

(assert (=> d!74513 m!440975))

(assert (=> d!74513 m!440811))

(assert (=> b!457928 d!74513))

(declare-fun d!74515 () Bool)

(declare-fun e!267447 () Bool)

(assert (=> d!74515 e!267447))

(declare-fun res!273732 () Bool)

(assert (=> d!74515 (=> (not res!273732) (not e!267447))))

(declare-fun lt!207117 () ListLongMap!7109)

(assert (=> d!74515 (= res!273732 (contains!2493 lt!207117 (_1!4114 (tuple2!8207 k0!794 v!412))))))

(declare-fun lt!207118 () List!8271)

(assert (=> d!74515 (= lt!207117 (ListLongMap!7110 lt!207118))))

(declare-fun lt!207119 () Unit!13291)

(declare-fun lt!207120 () Unit!13291)

(assert (=> d!74515 (= lt!207119 lt!207120)))

(declare-datatypes ((Option!376 0))(
  ( (Some!375 (v!8477 V!17539)) (None!374) )
))
(declare-fun getValueByKey!370 (List!8271 (_ BitVec 64)) Option!376)

(assert (=> d!74515 (= (getValueByKey!370 lt!207118 (_1!4114 (tuple2!8207 k0!794 v!412))) (Some!375 (_2!4114 (tuple2!8207 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!195 (List!8271 (_ BitVec 64) V!17539) Unit!13291)

(assert (=> d!74515 (= lt!207120 (lemmaContainsTupThenGetReturnValue!195 lt!207118 (_1!4114 (tuple2!8207 k0!794 v!412)) (_2!4114 (tuple2!8207 k0!794 v!412))))))

(declare-fun insertStrictlySorted!198 (List!8271 (_ BitVec 64) V!17539) List!8271)

(assert (=> d!74515 (= lt!207118 (insertStrictlySorted!198 (toList!3570 lt!207029) (_1!4114 (tuple2!8207 k0!794 v!412)) (_2!4114 (tuple2!8207 k0!794 v!412))))))

(assert (=> d!74515 (= (+!1624 lt!207029 (tuple2!8207 k0!794 v!412)) lt!207117)))

(declare-fun b!458124 () Bool)

(declare-fun res!273731 () Bool)

(assert (=> b!458124 (=> (not res!273731) (not e!267447))))

(assert (=> b!458124 (= res!273731 (= (getValueByKey!370 (toList!3570 lt!207117) (_1!4114 (tuple2!8207 k0!794 v!412))) (Some!375 (_2!4114 (tuple2!8207 k0!794 v!412)))))))

(declare-fun b!458125 () Bool)

(declare-fun contains!2494 (List!8271 tuple2!8206) Bool)

(assert (=> b!458125 (= e!267447 (contains!2494 (toList!3570 lt!207117) (tuple2!8207 k0!794 v!412)))))

(assert (= (and d!74515 res!273732) b!458124))

(assert (= (and b!458124 res!273731) b!458125))

(declare-fun m!440977 () Bool)

(assert (=> d!74515 m!440977))

(declare-fun m!440979 () Bool)

(assert (=> d!74515 m!440979))

(declare-fun m!440981 () Bool)

(assert (=> d!74515 m!440981))

(declare-fun m!440983 () Bool)

(assert (=> d!74515 m!440983))

(declare-fun m!440985 () Bool)

(assert (=> b!458124 m!440985))

(declare-fun m!440987 () Bool)

(assert (=> b!458125 m!440987))

(assert (=> b!457928 d!74515))

(declare-fun d!74517 () Bool)

(assert (=> d!74517 (= (validKeyInArray!0 (select (arr!13664 _keys!709) from!863)) (and (not (= (select (arr!13664 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13664 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457928 d!74517))

(declare-fun call!30100 () ListLongMap!7109)

(declare-fun bm!30097 () Bool)

(assert (=> bm!30097 (= call!30100 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458132 () Bool)

(declare-fun e!267453 () Bool)

(declare-fun e!267452 () Bool)

(assert (=> b!458132 (= e!267453 e!267452)))

(declare-fun c!56327 () Bool)

(assert (=> b!458132 (= c!56327 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!458133 () Bool)

(declare-fun call!30101 () ListLongMap!7109)

(assert (=> b!458133 (= e!267452 (= call!30101 call!30100))))

(declare-fun b!458134 () Bool)

(assert (=> b!458134 (= e!267452 (= call!30101 (+!1624 call!30100 (tuple2!8207 k0!794 v!412))))))

(declare-fun d!74519 () Bool)

(assert (=> d!74519 e!267453))

(declare-fun res!273735 () Bool)

(assert (=> d!74519 (=> (not res!273735) (not e!267453))))

(assert (=> d!74519 (= res!273735 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14017 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14018 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14017 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14018 _values!549))))))))

(declare-fun lt!207123 () Unit!13291)

(declare-fun choose!1339 (array!28443 array!28445 (_ BitVec 32) (_ BitVec 32) V!17539 V!17539 (_ BitVec 32) (_ BitVec 64) V!17539 (_ BitVec 32) Int) Unit!13291)

(assert (=> d!74519 (= lt!207123 (choose!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74519 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14017 _keys!709)))))

(assert (=> d!74519 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207123)))

(declare-fun bm!30098 () Bool)

(assert (=> bm!30098 (= call!30101 (getCurrentListMapNoExtraKeys!1764 (array!28444 (store (arr!13664 _keys!709) i!563 k0!794) (size!14017 _keys!709)) (array!28446 (store (arr!13665 _values!549) i!563 (ValueCellFull!5819 v!412)) (size!14018 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74519 res!273735) b!458132))

(assert (= (and b!458132 c!56327) b!458134))

(assert (= (and b!458132 (not c!56327)) b!458133))

(assert (= (or b!458134 b!458133) bm!30097))

(assert (= (or b!458134 b!458133) bm!30098))

(assert (=> bm!30097 m!440819))

(declare-fun m!440989 () Bool)

(assert (=> b!458134 m!440989))

(declare-fun m!440991 () Bool)

(assert (=> d!74519 m!440991))

(assert (=> bm!30098 m!440793))

(assert (=> bm!30098 m!440783))

(declare-fun m!440993 () Bool)

(assert (=> bm!30098 m!440993))

(assert (=> b!457928 d!74519))

(declare-fun lt!207129 () ListLongMap!7109)

(declare-fun b!458135 () Bool)

(declare-fun e!267458 () Bool)

(assert (=> b!458135 (= e!267458 (= lt!207129 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30099 () Bool)

(declare-fun call!30102 () ListLongMap!7109)

(assert (=> bm!30099 (= call!30102 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458136 () Bool)

(declare-fun e!267457 () Bool)

(declare-fun e!267459 () Bool)

(assert (=> b!458136 (= e!267457 e!267459)))

(declare-fun c!56330 () Bool)

(declare-fun e!267460 () Bool)

(assert (=> b!458136 (= c!56330 e!267460)))

(declare-fun res!273737 () Bool)

(assert (=> b!458136 (=> (not res!273737) (not e!267460))))

(assert (=> b!458136 (= res!273737 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 lt!207026)))))

(declare-fun b!458138 () Bool)

(declare-fun e!267455 () ListLongMap!7109)

(declare-fun e!267454 () ListLongMap!7109)

(assert (=> b!458138 (= e!267455 e!267454)))

(declare-fun c!56329 () Bool)

(assert (=> b!458138 (= c!56329 (validKeyInArray!0 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458139 () Bool)

(declare-fun lt!207125 () Unit!13291)

(declare-fun lt!207130 () Unit!13291)

(assert (=> b!458139 (= lt!207125 lt!207130)))

(declare-fun lt!207127 () (_ BitVec 64))

(declare-fun lt!207126 () (_ BitVec 64))

(declare-fun lt!207128 () V!17539)

(declare-fun lt!207124 () ListLongMap!7109)

(assert (=> b!458139 (not (contains!2493 (+!1624 lt!207124 (tuple2!8207 lt!207126 lt!207128)) lt!207127))))

(assert (=> b!458139 (= lt!207130 (addStillNotContains!149 lt!207124 lt!207126 lt!207128 lt!207127))))

(assert (=> b!458139 (= lt!207127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458139 (= lt!207128 (get!6734 (select (arr!13665 lt!207025) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458139 (= lt!207126 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458139 (= lt!207124 call!30102)))

(assert (=> b!458139 (= e!267454 (+!1624 call!30102 (tuple2!8207 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863)) (get!6734 (select (arr!13665 lt!207025) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458140 () Bool)

(assert (=> b!458140 (= e!267460 (validKeyInArray!0 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458140 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458141 () Bool)

(assert (=> b!458141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 lt!207026)))))

(assert (=> b!458141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14018 lt!207025)))))

(declare-fun e!267456 () Bool)

(assert (=> b!458141 (= e!267456 (= (apply!315 lt!207129 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863))) (get!6734 (select (arr!13665 lt!207025) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458142 () Bool)

(assert (=> b!458142 (= e!267459 e!267458)))

(declare-fun c!56328 () Bool)

(assert (=> b!458142 (= c!56328 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 lt!207026)))))

(declare-fun b!458143 () Bool)

(assert (=> b!458143 (= e!267458 (isEmpty!566 lt!207129))))

(declare-fun b!458144 () Bool)

(declare-fun res!273738 () Bool)

(assert (=> b!458144 (=> (not res!273738) (not e!267457))))

(assert (=> b!458144 (= res!273738 (not (contains!2493 lt!207129 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458137 () Bool)

(assert (=> b!458137 (= e!267459 e!267456)))

(assert (=> b!458137 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14017 lt!207026)))))

(declare-fun res!273739 () Bool)

(assert (=> b!458137 (= res!273739 (contains!2493 lt!207129 (select (arr!13664 lt!207026) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458137 (=> (not res!273739) (not e!267456))))

(declare-fun d!74521 () Bool)

(assert (=> d!74521 e!267457))

(declare-fun res!273736 () Bool)

(assert (=> d!74521 (=> (not res!273736) (not e!267457))))

(assert (=> d!74521 (= res!273736 (not (contains!2493 lt!207129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74521 (= lt!207129 e!267455)))

(declare-fun c!56331 () Bool)

(assert (=> d!74521 (= c!56331 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14017 lt!207026)))))

(assert (=> d!74521 (validMask!0 mask!1025)))

(assert (=> d!74521 (= (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207129)))

(declare-fun b!458145 () Bool)

(assert (=> b!458145 (= e!267454 call!30102)))

(declare-fun b!458146 () Bool)

(assert (=> b!458146 (= e!267455 (ListLongMap!7110 Nil!8268))))

(assert (= (and d!74521 c!56331) b!458146))

(assert (= (and d!74521 (not c!56331)) b!458138))

(assert (= (and b!458138 c!56329) b!458139))

(assert (= (and b!458138 (not c!56329)) b!458145))

(assert (= (or b!458139 b!458145) bm!30099))

(assert (= (and d!74521 res!273736) b!458144))

(assert (= (and b!458144 res!273738) b!458136))

(assert (= (and b!458136 res!273737) b!458140))

(assert (= (and b!458136 c!56330) b!458137))

(assert (= (and b!458136 (not c!56330)) b!458142))

(assert (= (and b!458137 res!273739) b!458141))

(assert (= (and b!458142 c!56328) b!458135))

(assert (= (and b!458142 (not c!56328)) b!458143))

(declare-fun b_lambda!9747 () Bool)

(assert (=> (not b_lambda!9747) (not b!458139)))

(assert (=> b!458139 t!14126))

(declare-fun b_and!19171 () Bool)

(assert (= b_and!19169 (and (=> t!14126 result!7179) b_and!19171)))

(declare-fun b_lambda!9749 () Bool)

(assert (=> (not b_lambda!9749) (not b!458141)))

(assert (=> b!458141 t!14126))

(declare-fun b_and!19173 () Bool)

(assert (= b_and!19171 (and (=> t!14126 result!7179) b_and!19173)))

(declare-fun m!440995 () Bool)

(assert (=> b!458138 m!440995))

(assert (=> b!458138 m!440995))

(declare-fun m!440997 () Bool)

(assert (=> b!458138 m!440997))

(assert (=> b!458137 m!440995))

(assert (=> b!458137 m!440995))

(declare-fun m!440999 () Bool)

(assert (=> b!458137 m!440999))

(declare-fun m!441001 () Bool)

(assert (=> b!458135 m!441001))

(declare-fun m!441003 () Bool)

(assert (=> b!458141 m!441003))

(assert (=> b!458141 m!440797))

(declare-fun m!441005 () Bool)

(assert (=> b!458141 m!441005))

(assert (=> b!458141 m!441003))

(assert (=> b!458141 m!440995))

(assert (=> b!458141 m!440995))

(declare-fun m!441007 () Bool)

(assert (=> b!458141 m!441007))

(assert (=> b!458141 m!440797))

(assert (=> b!458140 m!440995))

(assert (=> b!458140 m!440995))

(assert (=> b!458140 m!440997))

(declare-fun m!441009 () Bool)

(assert (=> b!458144 m!441009))

(assert (=> bm!30099 m!441001))

(declare-fun m!441011 () Bool)

(assert (=> b!458143 m!441011))

(assert (=> b!458139 m!441003))

(assert (=> b!458139 m!440797))

(assert (=> b!458139 m!441005))

(assert (=> b!458139 m!440995))

(declare-fun m!441013 () Bool)

(assert (=> b!458139 m!441013))

(declare-fun m!441015 () Bool)

(assert (=> b!458139 m!441015))

(assert (=> b!458139 m!440797))

(assert (=> b!458139 m!441003))

(declare-fun m!441017 () Bool)

(assert (=> b!458139 m!441017))

(declare-fun m!441019 () Bool)

(assert (=> b!458139 m!441019))

(assert (=> b!458139 m!441013))

(declare-fun m!441021 () Bool)

(assert (=> d!74521 m!441021))

(assert (=> d!74521 m!440811))

(assert (=> b!457928 d!74521))

(declare-fun d!74523 () Bool)

(assert (=> d!74523 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!457938 d!74523))

(declare-fun e!267465 () Bool)

(declare-fun b!458147 () Bool)

(declare-fun lt!207136 () ListLongMap!7109)

(assert (=> b!458147 (= e!267465 (= lt!207136 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30100 () Bool)

(declare-fun call!30103 () ListLongMap!7109)

(assert (=> bm!30100 (= call!30103 (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458148 () Bool)

(declare-fun e!267464 () Bool)

(declare-fun e!267466 () Bool)

(assert (=> b!458148 (= e!267464 e!267466)))

(declare-fun c!56334 () Bool)

(declare-fun e!267467 () Bool)

(assert (=> b!458148 (= c!56334 e!267467)))

(declare-fun res!273741 () Bool)

(assert (=> b!458148 (=> (not res!273741) (not e!267467))))

(assert (=> b!458148 (= res!273741 (bvslt from!863 (size!14017 lt!207026)))))

(declare-fun b!458150 () Bool)

(declare-fun e!267462 () ListLongMap!7109)

(declare-fun e!267461 () ListLongMap!7109)

(assert (=> b!458150 (= e!267462 e!267461)))

(declare-fun c!56333 () Bool)

(assert (=> b!458150 (= c!56333 (validKeyInArray!0 (select (arr!13664 lt!207026) from!863)))))

(declare-fun b!458151 () Bool)

(declare-fun lt!207132 () Unit!13291)

(declare-fun lt!207137 () Unit!13291)

(assert (=> b!458151 (= lt!207132 lt!207137)))

(declare-fun lt!207135 () V!17539)

(declare-fun lt!207133 () (_ BitVec 64))

(declare-fun lt!207131 () ListLongMap!7109)

(declare-fun lt!207134 () (_ BitVec 64))

(assert (=> b!458151 (not (contains!2493 (+!1624 lt!207131 (tuple2!8207 lt!207133 lt!207135)) lt!207134))))

(assert (=> b!458151 (= lt!207137 (addStillNotContains!149 lt!207131 lt!207133 lt!207135 lt!207134))))

(assert (=> b!458151 (= lt!207134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458151 (= lt!207135 (get!6734 (select (arr!13665 lt!207025) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458151 (= lt!207133 (select (arr!13664 lt!207026) from!863))))

(assert (=> b!458151 (= lt!207131 call!30103)))

(assert (=> b!458151 (= e!267461 (+!1624 call!30103 (tuple2!8207 (select (arr!13664 lt!207026) from!863) (get!6734 (select (arr!13665 lt!207025) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458152 () Bool)

(assert (=> b!458152 (= e!267467 (validKeyInArray!0 (select (arr!13664 lt!207026) from!863)))))

(assert (=> b!458152 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458153 () Bool)

(assert (=> b!458153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14017 lt!207026)))))

(assert (=> b!458153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14018 lt!207025)))))

(declare-fun e!267463 () Bool)

(assert (=> b!458153 (= e!267463 (= (apply!315 lt!207136 (select (arr!13664 lt!207026) from!863)) (get!6734 (select (arr!13665 lt!207025) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458154 () Bool)

(assert (=> b!458154 (= e!267466 e!267465)))

(declare-fun c!56332 () Bool)

(assert (=> b!458154 (= c!56332 (bvslt from!863 (size!14017 lt!207026)))))

(declare-fun b!458155 () Bool)

(assert (=> b!458155 (= e!267465 (isEmpty!566 lt!207136))))

(declare-fun b!458156 () Bool)

(declare-fun res!273742 () Bool)

(assert (=> b!458156 (=> (not res!273742) (not e!267464))))

(assert (=> b!458156 (= res!273742 (not (contains!2493 lt!207136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458149 () Bool)

(assert (=> b!458149 (= e!267466 e!267463)))

(assert (=> b!458149 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14017 lt!207026)))))

(declare-fun res!273743 () Bool)

(assert (=> b!458149 (= res!273743 (contains!2493 lt!207136 (select (arr!13664 lt!207026) from!863)))))

(assert (=> b!458149 (=> (not res!273743) (not e!267463))))

(declare-fun d!74525 () Bool)

(assert (=> d!74525 e!267464))

(declare-fun res!273740 () Bool)

(assert (=> d!74525 (=> (not res!273740) (not e!267464))))

(assert (=> d!74525 (= res!273740 (not (contains!2493 lt!207136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74525 (= lt!207136 e!267462)))

(declare-fun c!56335 () Bool)

(assert (=> d!74525 (= c!56335 (bvsge from!863 (size!14017 lt!207026)))))

(assert (=> d!74525 (validMask!0 mask!1025)))

(assert (=> d!74525 (= (getCurrentListMapNoExtraKeys!1764 lt!207026 lt!207025 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207136)))

(declare-fun b!458157 () Bool)

(assert (=> b!458157 (= e!267461 call!30103)))

(declare-fun b!458158 () Bool)

(assert (=> b!458158 (= e!267462 (ListLongMap!7110 Nil!8268))))

(assert (= (and d!74525 c!56335) b!458158))

(assert (= (and d!74525 (not c!56335)) b!458150))

(assert (= (and b!458150 c!56333) b!458151))

(assert (= (and b!458150 (not c!56333)) b!458157))

(assert (= (or b!458151 b!458157) bm!30100))

(assert (= (and d!74525 res!273740) b!458156))

(assert (= (and b!458156 res!273742) b!458148))

(assert (= (and b!458148 res!273741) b!458152))

(assert (= (and b!458148 c!56334) b!458149))

(assert (= (and b!458148 (not c!56334)) b!458154))

(assert (= (and b!458149 res!273743) b!458153))

(assert (= (and b!458154 c!56332) b!458147))

(assert (= (and b!458154 (not c!56332)) b!458155))

(declare-fun b_lambda!9751 () Bool)

(assert (=> (not b_lambda!9751) (not b!458151)))

(assert (=> b!458151 t!14126))

(declare-fun b_and!19175 () Bool)

(assert (= b_and!19173 (and (=> t!14126 result!7179) b_and!19175)))

(declare-fun b_lambda!9753 () Bool)

(assert (=> (not b_lambda!9753) (not b!458153)))

(assert (=> b!458153 t!14126))

(declare-fun b_and!19177 () Bool)

(assert (= b_and!19175 (and (=> t!14126 result!7179) b_and!19177)))

(declare-fun m!441023 () Bool)

(assert (=> b!458150 m!441023))

(assert (=> b!458150 m!441023))

(declare-fun m!441025 () Bool)

(assert (=> b!458150 m!441025))

(assert (=> b!458149 m!441023))

(assert (=> b!458149 m!441023))

(declare-fun m!441027 () Bool)

(assert (=> b!458149 m!441027))

(declare-fun m!441029 () Bool)

(assert (=> b!458147 m!441029))

(declare-fun m!441031 () Bool)

(assert (=> b!458153 m!441031))

(assert (=> b!458153 m!440797))

(declare-fun m!441033 () Bool)

(assert (=> b!458153 m!441033))

(assert (=> b!458153 m!441031))

(assert (=> b!458153 m!441023))

(assert (=> b!458153 m!441023))

(declare-fun m!441035 () Bool)

(assert (=> b!458153 m!441035))

(assert (=> b!458153 m!440797))

(assert (=> b!458152 m!441023))

(assert (=> b!458152 m!441023))

(assert (=> b!458152 m!441025))

(declare-fun m!441037 () Bool)

(assert (=> b!458156 m!441037))

(assert (=> bm!30100 m!441029))

(declare-fun m!441039 () Bool)

(assert (=> b!458155 m!441039))

(assert (=> b!458151 m!441031))

(assert (=> b!458151 m!440797))

(assert (=> b!458151 m!441033))

(assert (=> b!458151 m!441023))

(declare-fun m!441041 () Bool)

(assert (=> b!458151 m!441041))

(declare-fun m!441043 () Bool)

(assert (=> b!458151 m!441043))

(assert (=> b!458151 m!440797))

(assert (=> b!458151 m!441031))

(declare-fun m!441045 () Bool)

(assert (=> b!458151 m!441045))

(declare-fun m!441047 () Bool)

(assert (=> b!458151 m!441047))

(assert (=> b!458151 m!441041))

(declare-fun m!441049 () Bool)

(assert (=> d!74525 m!441049))

(assert (=> d!74525 m!440811))

(assert (=> b!457929 d!74525))

(declare-fun e!267472 () Bool)

(declare-fun lt!207143 () ListLongMap!7109)

(declare-fun b!458159 () Bool)

(assert (=> b!458159 (= e!267472 (= lt!207143 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!30101 () Bool)

(declare-fun call!30104 () ListLongMap!7109)

(assert (=> bm!30101 (= call!30104 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458160 () Bool)

(declare-fun e!267471 () Bool)

(declare-fun e!267473 () Bool)

(assert (=> b!458160 (= e!267471 e!267473)))

(declare-fun c!56338 () Bool)

(declare-fun e!267474 () Bool)

(assert (=> b!458160 (= c!56338 e!267474)))

(declare-fun res!273745 () Bool)

(assert (=> b!458160 (=> (not res!273745) (not e!267474))))

(assert (=> b!458160 (= res!273745 (bvslt from!863 (size!14017 _keys!709)))))

(declare-fun b!458162 () Bool)

(declare-fun e!267469 () ListLongMap!7109)

(declare-fun e!267468 () ListLongMap!7109)

(assert (=> b!458162 (= e!267469 e!267468)))

(declare-fun c!56337 () Bool)

(assert (=> b!458162 (= c!56337 (validKeyInArray!0 (select (arr!13664 _keys!709) from!863)))))

(declare-fun b!458163 () Bool)

(declare-fun lt!207139 () Unit!13291)

(declare-fun lt!207144 () Unit!13291)

(assert (=> b!458163 (= lt!207139 lt!207144)))

(declare-fun lt!207142 () V!17539)

(declare-fun lt!207138 () ListLongMap!7109)

(declare-fun lt!207140 () (_ BitVec 64))

(declare-fun lt!207141 () (_ BitVec 64))

(assert (=> b!458163 (not (contains!2493 (+!1624 lt!207138 (tuple2!8207 lt!207140 lt!207142)) lt!207141))))

(assert (=> b!458163 (= lt!207144 (addStillNotContains!149 lt!207138 lt!207140 lt!207142 lt!207141))))

(assert (=> b!458163 (= lt!207141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458163 (= lt!207142 (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458163 (= lt!207140 (select (arr!13664 _keys!709) from!863))))

(assert (=> b!458163 (= lt!207138 call!30104)))

(assert (=> b!458163 (= e!267468 (+!1624 call!30104 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458164 () Bool)

(assert (=> b!458164 (= e!267474 (validKeyInArray!0 (select (arr!13664 _keys!709) from!863)))))

(assert (=> b!458164 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458165 () Bool)

(assert (=> b!458165 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14017 _keys!709)))))

(assert (=> b!458165 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14018 _values!549)))))

(declare-fun e!267470 () Bool)

(assert (=> b!458165 (= e!267470 (= (apply!315 lt!207143 (select (arr!13664 _keys!709) from!863)) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!458166 () Bool)

(assert (=> b!458166 (= e!267473 e!267472)))

(declare-fun c!56336 () Bool)

(assert (=> b!458166 (= c!56336 (bvslt from!863 (size!14017 _keys!709)))))

(declare-fun b!458167 () Bool)

(assert (=> b!458167 (= e!267472 (isEmpty!566 lt!207143))))

(declare-fun b!458168 () Bool)

(declare-fun res!273746 () Bool)

(assert (=> b!458168 (=> (not res!273746) (not e!267471))))

(assert (=> b!458168 (= res!273746 (not (contains!2493 lt!207143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458161 () Bool)

(assert (=> b!458161 (= e!267473 e!267470)))

(assert (=> b!458161 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14017 _keys!709)))))

(declare-fun res!273747 () Bool)

(assert (=> b!458161 (= res!273747 (contains!2493 lt!207143 (select (arr!13664 _keys!709) from!863)))))

(assert (=> b!458161 (=> (not res!273747) (not e!267470))))

(declare-fun d!74527 () Bool)

(assert (=> d!74527 e!267471))

(declare-fun res!273744 () Bool)

(assert (=> d!74527 (=> (not res!273744) (not e!267471))))

(assert (=> d!74527 (= res!273744 (not (contains!2493 lt!207143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74527 (= lt!207143 e!267469)))

(declare-fun c!56339 () Bool)

(assert (=> d!74527 (= c!56339 (bvsge from!863 (size!14017 _keys!709)))))

(assert (=> d!74527 (validMask!0 mask!1025)))

(assert (=> d!74527 (= (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207143)))

(declare-fun b!458169 () Bool)

(assert (=> b!458169 (= e!267468 call!30104)))

(declare-fun b!458170 () Bool)

(assert (=> b!458170 (= e!267469 (ListLongMap!7110 Nil!8268))))

(assert (= (and d!74527 c!56339) b!458170))

(assert (= (and d!74527 (not c!56339)) b!458162))

(assert (= (and b!458162 c!56337) b!458163))

(assert (= (and b!458162 (not c!56337)) b!458169))

(assert (= (or b!458163 b!458169) bm!30101))

(assert (= (and d!74527 res!273744) b!458168))

(assert (= (and b!458168 res!273746) b!458160))

(assert (= (and b!458160 res!273745) b!458164))

(assert (= (and b!458160 c!56338) b!458161))

(assert (= (and b!458160 (not c!56338)) b!458166))

(assert (= (and b!458161 res!273747) b!458165))

(assert (= (and b!458166 c!56336) b!458159))

(assert (= (and b!458166 (not c!56336)) b!458167))

(declare-fun b_lambda!9755 () Bool)

(assert (=> (not b_lambda!9755) (not b!458163)))

(assert (=> b!458163 t!14126))

(declare-fun b_and!19179 () Bool)

(assert (= b_and!19177 (and (=> t!14126 result!7179) b_and!19179)))

(declare-fun b_lambda!9757 () Bool)

(assert (=> (not b_lambda!9757) (not b!458165)))

(assert (=> b!458165 t!14126))

(declare-fun b_and!19181 () Bool)

(assert (= b_and!19179 (and (=> t!14126 result!7179) b_and!19181)))

(assert (=> b!458162 m!440795))

(assert (=> b!458162 m!440795))

(assert (=> b!458162 m!440823))

(assert (=> b!458161 m!440795))

(assert (=> b!458161 m!440795))

(declare-fun m!441051 () Bool)

(assert (=> b!458161 m!441051))

(declare-fun m!441053 () Bool)

(assert (=> b!458159 m!441053))

(assert (=> b!458165 m!440799))

(assert (=> b!458165 m!440797))

(assert (=> b!458165 m!440801))

(assert (=> b!458165 m!440799))

(assert (=> b!458165 m!440795))

(assert (=> b!458165 m!440795))

(declare-fun m!441055 () Bool)

(assert (=> b!458165 m!441055))

(assert (=> b!458165 m!440797))

(assert (=> b!458164 m!440795))

(assert (=> b!458164 m!440795))

(assert (=> b!458164 m!440823))

(declare-fun m!441057 () Bool)

(assert (=> b!458168 m!441057))

(assert (=> bm!30101 m!441053))

(declare-fun m!441059 () Bool)

(assert (=> b!458167 m!441059))

(assert (=> b!458163 m!440799))

(assert (=> b!458163 m!440797))

(assert (=> b!458163 m!440801))

(assert (=> b!458163 m!440795))

(declare-fun m!441061 () Bool)

(assert (=> b!458163 m!441061))

(declare-fun m!441063 () Bool)

(assert (=> b!458163 m!441063))

(assert (=> b!458163 m!440797))

(assert (=> b!458163 m!440799))

(declare-fun m!441065 () Bool)

(assert (=> b!458163 m!441065))

(declare-fun m!441067 () Bool)

(assert (=> b!458163 m!441067))

(assert (=> b!458163 m!441061))

(declare-fun m!441069 () Bool)

(assert (=> d!74527 m!441069))

(assert (=> d!74527 m!440811))

(assert (=> b!457929 d!74527))

(declare-fun b!458171 () Bool)

(declare-fun e!267478 () Bool)

(assert (=> b!458171 (= e!267478 (contains!2492 Nil!8267 (select (arr!13664 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458172 () Bool)

(declare-fun e!267477 () Bool)

(declare-fun call!30105 () Bool)

(assert (=> b!458172 (= e!267477 call!30105)))

(declare-fun b!458173 () Bool)

(declare-fun e!267475 () Bool)

(assert (=> b!458173 (= e!267475 e!267477)))

(declare-fun c!56340 () Bool)

(assert (=> b!458173 (= c!56340 (validKeyInArray!0 (select (arr!13664 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30102 () Bool)

(assert (=> bm!30102 (= call!30105 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56340 (Cons!8266 (select (arr!13664 _keys!709) #b00000000000000000000000000000000) Nil!8267) Nil!8267)))))

(declare-fun b!458174 () Bool)

(declare-fun e!267476 () Bool)

(assert (=> b!458174 (= e!267476 e!267475)))

(declare-fun res!273749 () Bool)

(assert (=> b!458174 (=> (not res!273749) (not e!267475))))

(assert (=> b!458174 (= res!273749 (not e!267478))))

(declare-fun res!273748 () Bool)

(assert (=> b!458174 (=> (not res!273748) (not e!267478))))

(assert (=> b!458174 (= res!273748 (validKeyInArray!0 (select (arr!13664 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74529 () Bool)

(declare-fun res!273750 () Bool)

(assert (=> d!74529 (=> res!273750 e!267476)))

(assert (=> d!74529 (= res!273750 (bvsge #b00000000000000000000000000000000 (size!14017 _keys!709)))))

(assert (=> d!74529 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8267) e!267476)))

(declare-fun b!458175 () Bool)

(assert (=> b!458175 (= e!267477 call!30105)))

(assert (= (and d!74529 (not res!273750)) b!458174))

(assert (= (and b!458174 res!273748) b!458171))

(assert (= (and b!458174 res!273749) b!458173))

(assert (= (and b!458173 c!56340) b!458175))

(assert (= (and b!458173 (not c!56340)) b!458172))

(assert (= (or b!458175 b!458172) bm!30102))

(assert (=> b!458171 m!440927))

(assert (=> b!458171 m!440927))

(declare-fun m!441071 () Bool)

(assert (=> b!458171 m!441071))

(assert (=> b!458173 m!440927))

(assert (=> b!458173 m!440927))

(assert (=> b!458173 m!440937))

(assert (=> bm!30102 m!440927))

(declare-fun m!441073 () Bool)

(assert (=> bm!30102 m!441073))

(assert (=> b!458174 m!440927))

(assert (=> b!458174 m!440927))

(assert (=> b!458174 m!440937))

(assert (=> b!457939 d!74529))

(declare-fun d!74531 () Bool)

(assert (=> d!74531 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457930 d!74531))

(declare-fun d!74533 () Bool)

(declare-fun e!267479 () Bool)

(assert (=> d!74533 e!267479))

(declare-fun res!273752 () Bool)

(assert (=> d!74533 (=> (not res!273752) (not e!267479))))

(declare-fun lt!207145 () ListLongMap!7109)

(assert (=> d!74533 (= res!273752 (contains!2493 lt!207145 (_1!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207146 () List!8271)

(assert (=> d!74533 (= lt!207145 (ListLongMap!7110 lt!207146))))

(declare-fun lt!207147 () Unit!13291)

(declare-fun lt!207148 () Unit!13291)

(assert (=> d!74533 (= lt!207147 lt!207148)))

(assert (=> d!74533 (= (getValueByKey!370 lt!207146 (_1!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74533 (= lt!207148 (lemmaContainsTupThenGetReturnValue!195 lt!207146 (_1!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74533 (= lt!207146 (insertStrictlySorted!198 (toList!3570 lt!207028) (_1!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74533 (= (+!1624 lt!207028 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207145)))

(declare-fun b!458176 () Bool)

(declare-fun res!273751 () Bool)

(assert (=> b!458176 (=> (not res!273751) (not e!267479))))

(assert (=> b!458176 (= res!273751 (= (getValueByKey!370 (toList!3570 lt!207145) (_1!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4114 (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458177 () Bool)

(assert (=> b!458177 (= e!267479 (contains!2494 (toList!3570 lt!207145) (tuple2!8207 (select (arr!13664 _keys!709) from!863) (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74533 res!273752) b!458176))

(assert (= (and b!458176 res!273751) b!458177))

(declare-fun m!441075 () Bool)

(assert (=> d!74533 m!441075))

(declare-fun m!441077 () Bool)

(assert (=> d!74533 m!441077))

(declare-fun m!441079 () Bool)

(assert (=> d!74533 m!441079))

(declare-fun m!441081 () Bool)

(assert (=> d!74533 m!441081))

(declare-fun m!441083 () Bool)

(assert (=> b!458176 m!441083))

(declare-fun m!441085 () Bool)

(assert (=> b!458177 m!441085))

(assert (=> b!457931 d!74533))

(declare-fun d!74535 () Bool)

(declare-fun c!56343 () Bool)

(assert (=> d!74535 (= c!56343 ((_ is ValueCellFull!5819) (select (arr!13665 _values!549) from!863)))))

(declare-fun e!267482 () V!17539)

(assert (=> d!74535 (= (get!6734 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267482)))

(declare-fun b!458182 () Bool)

(declare-fun get!6736 (ValueCell!5819 V!17539) V!17539)

(assert (=> b!458182 (= e!267482 (get!6736 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458183 () Bool)

(declare-fun get!6737 (ValueCell!5819 V!17539) V!17539)

(assert (=> b!458183 (= e!267482 (get!6737 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74535 c!56343) b!458182))

(assert (= (and d!74535 (not c!56343)) b!458183))

(assert (=> b!458182 m!440799))

(assert (=> b!458182 m!440797))

(declare-fun m!441087 () Bool)

(assert (=> b!458182 m!441087))

(assert (=> b!458183 m!440799))

(assert (=> b!458183 m!440797))

(declare-fun m!441089 () Bool)

(assert (=> b!458183 m!441089))

(assert (=> b!457931 d!74535))

(declare-fun d!74537 () Bool)

(assert (=> d!74537 (= (array_inv!9952 _values!549) (bvsge (size!14018 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41060 d!74537))

(declare-fun d!74539 () Bool)

(assert (=> d!74539 (= (array_inv!9953 _keys!709) (bvsge (size!14017 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41060 d!74539))

(declare-fun b!458184 () Bool)

(declare-fun e!267484 () Bool)

(declare-fun e!267483 () Bool)

(assert (=> b!458184 (= e!267484 e!267483)))

(declare-fun lt!207149 () (_ BitVec 64))

(assert (=> b!458184 (= lt!207149 (select (arr!13664 lt!207026) #b00000000000000000000000000000000))))

(declare-fun lt!207151 () Unit!13291)

(assert (=> b!458184 (= lt!207151 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207026 lt!207149 #b00000000000000000000000000000000))))

(assert (=> b!458184 (arrayContainsKey!0 lt!207026 lt!207149 #b00000000000000000000000000000000)))

(declare-fun lt!207150 () Unit!13291)

(assert (=> b!458184 (= lt!207150 lt!207151)))

(declare-fun res!273753 () Bool)

(assert (=> b!458184 (= res!273753 (= (seekEntryOrOpen!0 (select (arr!13664 lt!207026) #b00000000000000000000000000000000) lt!207026 mask!1025) (Found!3529 #b00000000000000000000000000000000)))))

(assert (=> b!458184 (=> (not res!273753) (not e!267483))))

(declare-fun b!458185 () Bool)

(declare-fun call!30106 () Bool)

(assert (=> b!458185 (= e!267484 call!30106)))

(declare-fun b!458186 () Bool)

(assert (=> b!458186 (= e!267483 call!30106)))

(declare-fun bm!30103 () Bool)

(assert (=> bm!30103 (= call!30106 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207026 mask!1025))))

(declare-fun b!458187 () Bool)

(declare-fun e!267485 () Bool)

(assert (=> b!458187 (= e!267485 e!267484)))

(declare-fun c!56344 () Bool)

(assert (=> b!458187 (= c!56344 (validKeyInArray!0 (select (arr!13664 lt!207026) #b00000000000000000000000000000000)))))

(declare-fun d!74541 () Bool)

(declare-fun res!273754 () Bool)

(assert (=> d!74541 (=> res!273754 e!267485)))

(assert (=> d!74541 (= res!273754 (bvsge #b00000000000000000000000000000000 (size!14017 lt!207026)))))

(assert (=> d!74541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207026 mask!1025) e!267485)))

(assert (= (and d!74541 (not res!273754)) b!458187))

(assert (= (and b!458187 c!56344) b!458184))

(assert (= (and b!458187 (not c!56344)) b!458185))

(assert (= (and b!458184 res!273753) b!458186))

(assert (= (or b!458186 b!458185) bm!30103))

(assert (=> b!458184 m!440939))

(declare-fun m!441091 () Bool)

(assert (=> b!458184 m!441091))

(declare-fun m!441093 () Bool)

(assert (=> b!458184 m!441093))

(assert (=> b!458184 m!440939))

(declare-fun m!441095 () Bool)

(assert (=> b!458184 m!441095))

(declare-fun m!441097 () Bool)

(assert (=> bm!30103 m!441097))

(assert (=> b!458187 m!440939))

(assert (=> b!458187 m!440939))

(assert (=> b!458187 m!440943))

(assert (=> b!457926 d!74541))

(declare-fun condMapEmpty!20140 () Bool)

(declare-fun mapDefault!20140 () ValueCell!5819)

(assert (=> mapNonEmpty!20131 (= condMapEmpty!20140 (= mapRest!20131 ((as const (Array (_ BitVec 32) ValueCell!5819)) mapDefault!20140)))))

(declare-fun e!267490 () Bool)

(declare-fun mapRes!20140 () Bool)

(assert (=> mapNonEmpty!20131 (= tp!38790 (and e!267490 mapRes!20140))))

(declare-fun b!458194 () Bool)

(declare-fun e!267491 () Bool)

(assert (=> b!458194 (= e!267491 tp_is_empty!12325)))

(declare-fun mapIsEmpty!20140 () Bool)

(assert (=> mapIsEmpty!20140 mapRes!20140))

(declare-fun mapNonEmpty!20140 () Bool)

(declare-fun tp!38806 () Bool)

(assert (=> mapNonEmpty!20140 (= mapRes!20140 (and tp!38806 e!267491))))

(declare-fun mapRest!20140 () (Array (_ BitVec 32) ValueCell!5819))

(declare-fun mapKey!20140 () (_ BitVec 32))

(declare-fun mapValue!20140 () ValueCell!5819)

(assert (=> mapNonEmpty!20140 (= mapRest!20131 (store mapRest!20140 mapKey!20140 mapValue!20140))))

(declare-fun b!458195 () Bool)

(assert (=> b!458195 (= e!267490 tp_is_empty!12325)))

(assert (= (and mapNonEmpty!20131 condMapEmpty!20140) mapIsEmpty!20140))

(assert (= (and mapNonEmpty!20131 (not condMapEmpty!20140)) mapNonEmpty!20140))

(assert (= (and mapNonEmpty!20140 ((_ is ValueCellFull!5819) mapValue!20140)) b!458194))

(assert (= (and mapNonEmpty!20131 ((_ is ValueCellFull!5819) mapDefault!20140)) b!458195))

(declare-fun m!441099 () Bool)

(assert (=> mapNonEmpty!20140 m!441099))

(declare-fun b_lambda!9759 () Bool)

(assert (= b_lambda!9747 (or (and start!41060 b_free!10987) b_lambda!9759)))

(declare-fun b_lambda!9761 () Bool)

(assert (= b_lambda!9755 (or (and start!41060 b_free!10987) b_lambda!9761)))

(declare-fun b_lambda!9763 () Bool)

(assert (= b_lambda!9757 (or (and start!41060 b_free!10987) b_lambda!9763)))

(declare-fun b_lambda!9765 () Bool)

(assert (= b_lambda!9743 (or (and start!41060 b_free!10987) b_lambda!9765)))

(declare-fun b_lambda!9767 () Bool)

(assert (= b_lambda!9749 (or (and start!41060 b_free!10987) b_lambda!9767)))

(declare-fun b_lambda!9769 () Bool)

(assert (= b_lambda!9745 (or (and start!41060 b_free!10987) b_lambda!9769)))

(declare-fun b_lambda!9771 () Bool)

(assert (= b_lambda!9753 (or (and start!41060 b_free!10987) b_lambda!9771)))

(declare-fun b_lambda!9773 () Bool)

(assert (= b_lambda!9751 (or (and start!41060 b_free!10987) b_lambda!9773)))

(check-sat (not b!458182) (not b!458134) (not mapNonEmpty!20140) (not b!458167) (not b_lambda!9759) (not b!458161) (not b_lambda!9769) (not b!458124) (not bm!30101) (not b!458139) (not b!458174) (not b!458083) (not d!74533) (not b!458183) (not b_lambda!9761) (not d!74519) (not b!458152) (not b!458165) (not b_lambda!9765) (not b!458150) (not b!458116) (not d!74515) (not b!458171) (not b!458111) (not b!458140) (not b!458144) (not b!458137) (not b!458155) (not b_next!10987) (not b!458153) (not b!458184) (not b!458162) (not b!458176) (not b!458114) (not b!458177) (not b_lambda!9763) (not b!458187) tp_is_empty!12325 (not b!458168) b_and!19181 (not b_lambda!9767) (not b!458163) (not b!458173) (not d!74527) (not b!458117) (not b!458073) (not d!74513) (not d!74521) (not bm!30103) (not b!458151) (not bm!30092) (not b!458147) (not b_lambda!9773) (not b!458076) (not b!458138) (not bm!30089) (not b!458141) (not b!458108) (not b!458113) (not bm!30098) (not b!458135) (not bm!30097) (not b_lambda!9741) (not bm!30086) (not bm!30100) (not b!458059) (not b!458110) (not bm!30102) (not b!458125) (not b!458156) (not d!74525) (not b!458075) (not b!458112) (not b!458159) (not b!458143) (not b!458062) (not b_lambda!9771) (not b!458149) (not bm!30099) (not b!458164))
(check-sat b_and!19181 (not b_next!10987))
