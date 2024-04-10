; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41018 () Bool)

(assert start!41018)

(declare-fun b_free!10953 () Bool)

(declare-fun b_next!10953 () Bool)

(assert (=> start!41018 (= b_free!10953 (not b_next!10953))))

(declare-fun tp!38685 () Bool)

(declare-fun b_and!19097 () Bool)

(assert (=> start!41018 (= tp!38685 b_and!19097)))

(declare-fun b!457151 () Bool)

(declare-fun res!272959 () Bool)

(declare-fun e!267013 () Bool)

(assert (=> b!457151 (=> (not res!272959) (not e!267013))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457151 (= res!272959 (bvsle from!863 i!563))))

(declare-fun b!457152 () Bool)

(declare-fun e!267018 () Bool)

(declare-fun e!267012 () Bool)

(assert (=> b!457152 (= e!267018 (not e!267012))))

(declare-fun res!272957 () Bool)

(assert (=> b!457152 (=> res!272957 e!267012)))

(declare-datatypes ((array!28383 0))(
  ( (array!28384 (arr!13635 (Array (_ BitVec 32) (_ BitVec 64))) (size!13987 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28383)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457152 (= res!272957 (not (validKeyInArray!0 (select (arr!13635 _keys!709) from!863))))))

(declare-datatypes ((V!17493 0))(
  ( (V!17494 (val!6190 Int)) )
))
(declare-datatypes ((tuple2!8154 0))(
  ( (tuple2!8155 (_1!4088 (_ BitVec 64)) (_2!4088 V!17493)) )
))
(declare-datatypes ((List!8228 0))(
  ( (Nil!8225) (Cons!8224 (h!9080 tuple2!8154) (t!14060 List!8228)) )
))
(declare-datatypes ((ListLongMap!7067 0))(
  ( (ListLongMap!7068 (toList!3549 List!8228)) )
))
(declare-fun lt!206780 () ListLongMap!7067)

(declare-fun lt!206776 () ListLongMap!7067)

(assert (=> b!457152 (= lt!206780 lt!206776)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206778 () ListLongMap!7067)

(declare-fun v!412 () V!17493)

(declare-fun +!1585 (ListLongMap!7067 tuple2!8154) ListLongMap!7067)

(assert (=> b!457152 (= lt!206776 (+!1585 lt!206778 (tuple2!8155 k0!794 v!412)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17493)

(declare-fun lt!206783 () array!28383)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17493)

(declare-datatypes ((ValueCell!5802 0))(
  ( (ValueCellFull!5802 (v!8456 V!17493)) (EmptyCell!5802) )
))
(declare-datatypes ((array!28385 0))(
  ( (array!28386 (arr!13636 (Array (_ BitVec 32) ValueCell!5802)) (size!13988 (_ BitVec 32))) )
))
(declare-fun lt!206779 () array!28385)

(declare-fun getCurrentListMapNoExtraKeys!1732 (array!28383 array!28385 (_ BitVec 32) (_ BitVec 32) V!17493 V!17493 (_ BitVec 32) Int) ListLongMap!7067)

(assert (=> b!457152 (= lt!206780 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28385)

(assert (=> b!457152 (= lt!206778 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13292 0))(
  ( (Unit!13293) )
))
(declare-fun lt!206781 () Unit!13292)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 (array!28383 array!28385 (_ BitVec 32) (_ BitVec 32) V!17493 V!17493 (_ BitVec 32) (_ BitVec 64) V!17493 (_ BitVec 32) Int) Unit!13292)

(assert (=> b!457152 (= lt!206781 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!272962 () Bool)

(declare-fun e!267017 () Bool)

(assert (=> start!41018 (=> (not res!272962) (not e!267017))))

(assert (=> start!41018 (= res!272962 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13987 _keys!709))))))

(assert (=> start!41018 e!267017))

(declare-fun tp_is_empty!12291 () Bool)

(assert (=> start!41018 tp_is_empty!12291))

(assert (=> start!41018 tp!38685))

(assert (=> start!41018 true))

(declare-fun e!267014 () Bool)

(declare-fun array_inv!9872 (array!28385) Bool)

(assert (=> start!41018 (and (array_inv!9872 _values!549) e!267014)))

(declare-fun array_inv!9873 (array!28383) Bool)

(assert (=> start!41018 (array_inv!9873 _keys!709)))

(declare-fun b!457153 () Bool)

(declare-fun res!272963 () Bool)

(assert (=> b!457153 (=> (not res!272963) (not e!267017))))

(declare-datatypes ((List!8229 0))(
  ( (Nil!8226) (Cons!8225 (h!9081 (_ BitVec 64)) (t!14061 List!8229)) )
))
(declare-fun arrayNoDuplicates!0 (array!28383 (_ BitVec 32) List!8229) Bool)

(assert (=> b!457153 (= res!272963 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!457154 () Bool)

(declare-fun res!272955 () Bool)

(assert (=> b!457154 (=> (not res!272955) (not e!267017))))

(declare-fun arrayContainsKey!0 (array!28383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457154 (= res!272955 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457155 () Bool)

(declare-fun res!272954 () Bool)

(assert (=> b!457155 (=> (not res!272954) (not e!267017))))

(assert (=> b!457155 (= res!272954 (and (= (size!13988 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13987 _keys!709) (size!13988 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457156 () Bool)

(declare-fun res!272950 () Bool)

(assert (=> b!457156 (=> (not res!272950) (not e!267017))))

(assert (=> b!457156 (= res!272950 (or (= (select (arr!13635 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13635 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457157 () Bool)

(declare-fun e!267019 () Bool)

(declare-fun mapRes!20077 () Bool)

(assert (=> b!457157 (= e!267014 (and e!267019 mapRes!20077))))

(declare-fun condMapEmpty!20077 () Bool)

(declare-fun mapDefault!20077 () ValueCell!5802)

(assert (=> b!457157 (= condMapEmpty!20077 (= (arr!13636 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5802)) mapDefault!20077)))))

(declare-fun b!457158 () Bool)

(declare-fun res!272953 () Bool)

(assert (=> b!457158 (=> (not res!272953) (not e!267017))))

(assert (=> b!457158 (= res!272953 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20077 () Bool)

(declare-fun tp!38686 () Bool)

(declare-fun e!267016 () Bool)

(assert (=> mapNonEmpty!20077 (= mapRes!20077 (and tp!38686 e!267016))))

(declare-fun mapKey!20077 () (_ BitVec 32))

(declare-fun mapValue!20077 () ValueCell!5802)

(declare-fun mapRest!20077 () (Array (_ BitVec 32) ValueCell!5802))

(assert (=> mapNonEmpty!20077 (= (arr!13636 _values!549) (store mapRest!20077 mapKey!20077 mapValue!20077))))

(declare-fun b!457159 () Bool)

(declare-fun lt!206777 () ListLongMap!7067)

(declare-fun get!6708 (ValueCell!5802 V!17493) V!17493)

(declare-fun dynLambda!876 (Int (_ BitVec 64)) V!17493)

(assert (=> b!457159 (= e!267012 (= lt!206777 (+!1585 lt!206776 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!457160 () Bool)

(assert (=> b!457160 (= e!267013 e!267018)))

(declare-fun res!272952 () Bool)

(assert (=> b!457160 (=> (not res!272952) (not e!267018))))

(assert (=> b!457160 (= res!272952 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457160 (= lt!206777 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457160 (= lt!206779 (array!28386 (store (arr!13636 _values!549) i!563 (ValueCellFull!5802 v!412)) (size!13988 _values!549)))))

(declare-fun lt!206782 () ListLongMap!7067)

(assert (=> b!457160 (= lt!206782 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457161 () Bool)

(assert (=> b!457161 (= e!267019 tp_is_empty!12291)))

(declare-fun b!457162 () Bool)

(declare-fun res!272951 () Bool)

(assert (=> b!457162 (=> (not res!272951) (not e!267017))))

(assert (=> b!457162 (= res!272951 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13987 _keys!709))))))

(declare-fun mapIsEmpty!20077 () Bool)

(assert (=> mapIsEmpty!20077 mapRes!20077))

(declare-fun b!457163 () Bool)

(declare-fun res!272960 () Bool)

(assert (=> b!457163 (=> (not res!272960) (not e!267017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28383 (_ BitVec 32)) Bool)

(assert (=> b!457163 (= res!272960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457164 () Bool)

(assert (=> b!457164 (= e!267016 tp_is_empty!12291)))

(declare-fun b!457165 () Bool)

(declare-fun res!272961 () Bool)

(assert (=> b!457165 (=> (not res!272961) (not e!267013))))

(assert (=> b!457165 (= res!272961 (arrayNoDuplicates!0 lt!206783 #b00000000000000000000000000000000 Nil!8226))))

(declare-fun b!457166 () Bool)

(assert (=> b!457166 (= e!267017 e!267013)))

(declare-fun res!272956 () Bool)

(assert (=> b!457166 (=> (not res!272956) (not e!267013))))

(assert (=> b!457166 (= res!272956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206783 mask!1025))))

(assert (=> b!457166 (= lt!206783 (array!28384 (store (arr!13635 _keys!709) i!563 k0!794) (size!13987 _keys!709)))))

(declare-fun b!457167 () Bool)

(declare-fun res!272958 () Bool)

(assert (=> b!457167 (=> (not res!272958) (not e!267017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457167 (= res!272958 (validMask!0 mask!1025))))

(assert (= (and start!41018 res!272962) b!457167))

(assert (= (and b!457167 res!272958) b!457155))

(assert (= (and b!457155 res!272954) b!457163))

(assert (= (and b!457163 res!272960) b!457153))

(assert (= (and b!457153 res!272963) b!457162))

(assert (= (and b!457162 res!272951) b!457158))

(assert (= (and b!457158 res!272953) b!457156))

(assert (= (and b!457156 res!272950) b!457154))

(assert (= (and b!457154 res!272955) b!457166))

(assert (= (and b!457166 res!272956) b!457165))

(assert (= (and b!457165 res!272961) b!457151))

(assert (= (and b!457151 res!272959) b!457160))

(assert (= (and b!457160 res!272952) b!457152))

(assert (= (and b!457152 (not res!272957)) b!457159))

(assert (= (and b!457157 condMapEmpty!20077) mapIsEmpty!20077))

(assert (= (and b!457157 (not condMapEmpty!20077)) mapNonEmpty!20077))

(get-info :version)

(assert (= (and mapNonEmpty!20077 ((_ is ValueCellFull!5802) mapValue!20077)) b!457164))

(assert (= (and b!457157 ((_ is ValueCellFull!5802) mapDefault!20077)) b!457161))

(assert (= start!41018 b!457157))

(declare-fun b_lambda!9685 () Bool)

(assert (=> (not b_lambda!9685) (not b!457159)))

(declare-fun t!14059 () Bool)

(declare-fun tb!3789 () Bool)

(assert (=> (and start!41018 (= defaultEntry!557 defaultEntry!557) t!14059) tb!3789))

(declare-fun result!7117 () Bool)

(assert (=> tb!3789 (= result!7117 tp_is_empty!12291)))

(assert (=> b!457159 t!14059))

(declare-fun b_and!19099 () Bool)

(assert (= b_and!19097 (and (=> t!14059 result!7117) b_and!19099)))

(declare-fun m!440487 () Bool)

(assert (=> start!41018 m!440487))

(declare-fun m!440489 () Bool)

(assert (=> start!41018 m!440489))

(declare-fun m!440491 () Bool)

(assert (=> b!457153 m!440491))

(declare-fun m!440493 () Bool)

(assert (=> b!457152 m!440493))

(declare-fun m!440495 () Bool)

(assert (=> b!457152 m!440495))

(declare-fun m!440497 () Bool)

(assert (=> b!457152 m!440497))

(declare-fun m!440499 () Bool)

(assert (=> b!457152 m!440499))

(assert (=> b!457152 m!440493))

(declare-fun m!440501 () Bool)

(assert (=> b!457152 m!440501))

(declare-fun m!440503 () Bool)

(assert (=> b!457152 m!440503))

(declare-fun m!440505 () Bool)

(assert (=> b!457158 m!440505))

(declare-fun m!440507 () Bool)

(assert (=> b!457154 m!440507))

(assert (=> b!457159 m!440493))

(declare-fun m!440509 () Bool)

(assert (=> b!457159 m!440509))

(declare-fun m!440511 () Bool)

(assert (=> b!457159 m!440511))

(declare-fun m!440513 () Bool)

(assert (=> b!457159 m!440513))

(assert (=> b!457159 m!440513))

(assert (=> b!457159 m!440509))

(declare-fun m!440515 () Bool)

(assert (=> b!457159 m!440515))

(declare-fun m!440517 () Bool)

(assert (=> b!457167 m!440517))

(declare-fun m!440519 () Bool)

(assert (=> mapNonEmpty!20077 m!440519))

(declare-fun m!440521 () Bool)

(assert (=> b!457160 m!440521))

(declare-fun m!440523 () Bool)

(assert (=> b!457160 m!440523))

(declare-fun m!440525 () Bool)

(assert (=> b!457160 m!440525))

(declare-fun m!440527 () Bool)

(assert (=> b!457165 m!440527))

(declare-fun m!440529 () Bool)

(assert (=> b!457156 m!440529))

(declare-fun m!440531 () Bool)

(assert (=> b!457163 m!440531))

(declare-fun m!440533 () Bool)

(assert (=> b!457166 m!440533))

(declare-fun m!440535 () Bool)

(assert (=> b!457166 m!440535))

(check-sat (not b!457160) (not b_next!10953) (not start!41018) (not b!457166) tp_is_empty!12291 (not b!457159) (not b!457158) (not mapNonEmpty!20077) (not b!457153) (not b!457152) (not b!457163) (not b!457165) (not b!457154) (not b_lambda!9685) (not b!457167) b_and!19099)
(check-sat b_and!19099 (not b_next!10953))
(get-model)

(declare-fun b_lambda!9689 () Bool)

(assert (= b_lambda!9685 (or (and start!41018 b_free!10953) b_lambda!9689)))

(check-sat (not b!457160) (not b_next!10953) (not start!41018) (not b!457154) tp_is_empty!12291 (not b!457159) (not b!457158) (not mapNonEmpty!20077) (not b!457153) (not b!457152) (not b!457163) (not b!457165) (not b_lambda!9689) (not b!457166) (not b!457167) b_and!19099)
(check-sat b_and!19099 (not b_next!10953))
(get-model)

(declare-fun b!457233 () Bool)

(declare-fun e!267052 () Bool)

(declare-fun call!30094 () Bool)

(assert (=> b!457233 (= e!267052 call!30094)))

(declare-fun b!457234 () Bool)

(declare-fun e!267053 () Bool)

(assert (=> b!457234 (= e!267053 e!267052)))

(declare-fun c!56342 () Bool)

(assert (=> b!457234 (= c!56342 (validKeyInArray!0 (select (arr!13635 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457235 () Bool)

(declare-fun e!267054 () Bool)

(assert (=> b!457235 (= e!267054 e!267053)))

(declare-fun res!273013 () Bool)

(assert (=> b!457235 (=> (not res!273013) (not e!267053))))

(declare-fun e!267055 () Bool)

(assert (=> b!457235 (= res!273013 (not e!267055))))

(declare-fun res!273014 () Bool)

(assert (=> b!457235 (=> (not res!273014) (not e!267055))))

(assert (=> b!457235 (= res!273014 (validKeyInArray!0 (select (arr!13635 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74663 () Bool)

(declare-fun res!273012 () Bool)

(assert (=> d!74663 (=> res!273012 e!267054)))

(assert (=> d!74663 (= res!273012 (bvsge #b00000000000000000000000000000000 (size!13987 _keys!709)))))

(assert (=> d!74663 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8226) e!267054)))

(declare-fun bm!30091 () Bool)

(assert (=> bm!30091 (= call!30094 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56342 (Cons!8225 (select (arr!13635 _keys!709) #b00000000000000000000000000000000) Nil!8226) Nil!8226)))))

(declare-fun b!457236 () Bool)

(declare-fun contains!2500 (List!8229 (_ BitVec 64)) Bool)

(assert (=> b!457236 (= e!267055 (contains!2500 Nil!8226 (select (arr!13635 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457237 () Bool)

(assert (=> b!457237 (= e!267052 call!30094)))

(assert (= (and d!74663 (not res!273012)) b!457235))

(assert (= (and b!457235 res!273014) b!457236))

(assert (= (and b!457235 res!273013) b!457234))

(assert (= (and b!457234 c!56342) b!457233))

(assert (= (and b!457234 (not c!56342)) b!457237))

(assert (= (or b!457233 b!457237) bm!30091))

(declare-fun m!440587 () Bool)

(assert (=> b!457234 m!440587))

(assert (=> b!457234 m!440587))

(declare-fun m!440589 () Bool)

(assert (=> b!457234 m!440589))

(assert (=> b!457235 m!440587))

(assert (=> b!457235 m!440587))

(assert (=> b!457235 m!440589))

(assert (=> bm!30091 m!440587))

(declare-fun m!440591 () Bool)

(assert (=> bm!30091 m!440591))

(assert (=> b!457236 m!440587))

(assert (=> b!457236 m!440587))

(declare-fun m!440593 () Bool)

(assert (=> b!457236 m!440593))

(assert (=> b!457153 d!74663))

(declare-fun d!74665 () Bool)

(declare-fun res!273019 () Bool)

(declare-fun e!267060 () Bool)

(assert (=> d!74665 (=> res!273019 e!267060)))

(assert (=> d!74665 (= res!273019 (= (select (arr!13635 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74665 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267060)))

(declare-fun b!457242 () Bool)

(declare-fun e!267061 () Bool)

(assert (=> b!457242 (= e!267060 e!267061)))

(declare-fun res!273020 () Bool)

(assert (=> b!457242 (=> (not res!273020) (not e!267061))))

(assert (=> b!457242 (= res!273020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13987 _keys!709)))))

(declare-fun b!457243 () Bool)

(assert (=> b!457243 (= e!267061 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74665 (not res!273019)) b!457242))

(assert (= (and b!457242 res!273020) b!457243))

(assert (=> d!74665 m!440587))

(declare-fun m!440595 () Bool)

(assert (=> b!457243 m!440595))

(assert (=> b!457154 d!74665))

(declare-fun b!457268 () Bool)

(declare-fun e!267080 () Bool)

(declare-fun e!267078 () Bool)

(assert (=> b!457268 (= e!267080 e!267078)))

(declare-fun c!56353 () Bool)

(assert (=> b!457268 (= c!56353 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(declare-fun b!457269 () Bool)

(declare-fun e!267076 () Bool)

(assert (=> b!457269 (= e!267080 e!267076)))

(assert (=> b!457269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(declare-fun lt!206828 () ListLongMap!7067)

(declare-fun res!273031 () Bool)

(declare-fun contains!2501 (ListLongMap!7067 (_ BitVec 64)) Bool)

(assert (=> b!457269 (= res!273031 (contains!2501 lt!206828 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457269 (=> (not res!273031) (not e!267076))))

(declare-fun b!457270 () Bool)

(declare-fun e!267082 () ListLongMap!7067)

(declare-fun call!30097 () ListLongMap!7067)

(assert (=> b!457270 (= e!267082 call!30097)))

(declare-fun b!457271 () Bool)

(assert (=> b!457271 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(assert (=> b!457271 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13988 _values!549)))))

(declare-fun apply!314 (ListLongMap!7067 (_ BitVec 64)) V!17493)

(assert (=> b!457271 (= e!267076 (= (apply!314 lt!206828 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6708 (select (arr!13636 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457272 () Bool)

(declare-fun e!267081 () Bool)

(assert (=> b!457272 (= e!267081 e!267080)))

(declare-fun c!56352 () Bool)

(declare-fun e!267079 () Bool)

(assert (=> b!457272 (= c!56352 e!267079)))

(declare-fun res!273029 () Bool)

(assert (=> b!457272 (=> (not res!273029) (not e!267079))))

(assert (=> b!457272 (= res!273029 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(declare-fun b!457274 () Bool)

(declare-fun e!267077 () ListLongMap!7067)

(assert (=> b!457274 (= e!267077 (ListLongMap!7068 Nil!8225))))

(declare-fun b!457275 () Bool)

(assert (=> b!457275 (= e!267079 (validKeyInArray!0 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457275 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!457276 () Bool)

(declare-fun res!273030 () Bool)

(assert (=> b!457276 (=> (not res!273030) (not e!267081))))

(assert (=> b!457276 (= res!273030 (not (contains!2501 lt!206828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457277 () Bool)

(declare-fun lt!206827 () Unit!13292)

(declare-fun lt!206826 () Unit!13292)

(assert (=> b!457277 (= lt!206827 lt!206826)))

(declare-fun lt!206823 () ListLongMap!7067)

(declare-fun lt!206824 () V!17493)

(declare-fun lt!206825 () (_ BitVec 64))

(declare-fun lt!206822 () (_ BitVec 64))

(assert (=> b!457277 (not (contains!2501 (+!1585 lt!206823 (tuple2!8155 lt!206825 lt!206824)) lt!206822))))

(declare-fun addStillNotContains!147 (ListLongMap!7067 (_ BitVec 64) V!17493 (_ BitVec 64)) Unit!13292)

(assert (=> b!457277 (= lt!206826 (addStillNotContains!147 lt!206823 lt!206825 lt!206824 lt!206822))))

(assert (=> b!457277 (= lt!206822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457277 (= lt!206824 (get!6708 (select (arr!13636 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457277 (= lt!206825 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457277 (= lt!206823 call!30097)))

(assert (=> b!457277 (= e!267082 (+!1585 call!30097 (tuple2!8155 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6708 (select (arr!13636 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457278 () Bool)

(declare-fun isEmpty!561 (ListLongMap!7067) Bool)

(assert (=> b!457278 (= e!267078 (isEmpty!561 lt!206828))))

(declare-fun b!457273 () Bool)

(assert (=> b!457273 (= e!267078 (= lt!206828 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74667 () Bool)

(assert (=> d!74667 e!267081))

(declare-fun res!273032 () Bool)

(assert (=> d!74667 (=> (not res!273032) (not e!267081))))

(assert (=> d!74667 (= res!273032 (not (contains!2501 lt!206828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74667 (= lt!206828 e!267077)))

(declare-fun c!56351 () Bool)

(assert (=> d!74667 (= c!56351 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(assert (=> d!74667 (validMask!0 mask!1025)))

(assert (=> d!74667 (= (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206828)))

(declare-fun b!457279 () Bool)

(assert (=> b!457279 (= e!267077 e!267082)))

(declare-fun c!56354 () Bool)

(assert (=> b!457279 (= c!56354 (validKeyInArray!0 (select (arr!13635 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun bm!30094 () Bool)

(assert (=> bm!30094 (= call!30097 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74667 c!56351) b!457274))

(assert (= (and d!74667 (not c!56351)) b!457279))

(assert (= (and b!457279 c!56354) b!457277))

(assert (= (and b!457279 (not c!56354)) b!457270))

(assert (= (or b!457277 b!457270) bm!30094))

(assert (= (and d!74667 res!273032) b!457276))

(assert (= (and b!457276 res!273030) b!457272))

(assert (= (and b!457272 res!273029) b!457275))

(assert (= (and b!457272 c!56352) b!457269))

(assert (= (and b!457272 (not c!56352)) b!457268))

(assert (= (and b!457269 res!273031) b!457271))

(assert (= (and b!457268 c!56353) b!457273))

(assert (= (and b!457268 (not c!56353)) b!457278))

(declare-fun b_lambda!9691 () Bool)

(assert (=> (not b_lambda!9691) (not b!457271)))

(assert (=> b!457271 t!14059))

(declare-fun b_and!19105 () Bool)

(assert (= b_and!19099 (and (=> t!14059 result!7117) b_and!19105)))

(declare-fun b_lambda!9693 () Bool)

(assert (=> (not b_lambda!9693) (not b!457277)))

(assert (=> b!457277 t!14059))

(declare-fun b_and!19107 () Bool)

(assert (= b_and!19105 (and (=> t!14059 result!7117) b_and!19107)))

(declare-fun m!440597 () Bool)

(assert (=> b!457276 m!440597))

(declare-fun m!440599 () Bool)

(assert (=> b!457275 m!440599))

(assert (=> b!457275 m!440599))

(declare-fun m!440601 () Bool)

(assert (=> b!457275 m!440601))

(declare-fun m!440603 () Bool)

(assert (=> b!457278 m!440603))

(declare-fun m!440605 () Bool)

(assert (=> d!74667 m!440605))

(assert (=> d!74667 m!440517))

(declare-fun m!440607 () Bool)

(assert (=> b!457277 m!440607))

(declare-fun m!440609 () Bool)

(assert (=> b!457277 m!440609))

(declare-fun m!440611 () Bool)

(assert (=> b!457277 m!440611))

(assert (=> b!457277 m!440509))

(assert (=> b!457277 m!440599))

(declare-fun m!440613 () Bool)

(assert (=> b!457277 m!440613))

(assert (=> b!457277 m!440611))

(declare-fun m!440615 () Bool)

(assert (=> b!457277 m!440615))

(assert (=> b!457277 m!440613))

(assert (=> b!457277 m!440509))

(declare-fun m!440617 () Bool)

(assert (=> b!457277 m!440617))

(assert (=> b!457279 m!440599))

(assert (=> b!457279 m!440599))

(assert (=> b!457279 m!440601))

(assert (=> b!457269 m!440599))

(assert (=> b!457269 m!440599))

(declare-fun m!440619 () Bool)

(assert (=> b!457269 m!440619))

(assert (=> b!457271 m!440599))

(declare-fun m!440621 () Bool)

(assert (=> b!457271 m!440621))

(assert (=> b!457271 m!440613))

(assert (=> b!457271 m!440509))

(assert (=> b!457271 m!440617))

(assert (=> b!457271 m!440509))

(assert (=> b!457271 m!440599))

(assert (=> b!457271 m!440613))

(declare-fun m!440623 () Bool)

(assert (=> bm!30094 m!440623))

(assert (=> b!457273 m!440623))

(assert (=> b!457152 d!74667))

(declare-fun b!457280 () Bool)

(declare-fun e!267087 () Bool)

(declare-fun e!267085 () Bool)

(assert (=> b!457280 (= e!267087 e!267085)))

(declare-fun c!56357 () Bool)

(assert (=> b!457280 (= c!56357 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 lt!206783)))))

(declare-fun b!457281 () Bool)

(declare-fun e!267083 () Bool)

(assert (=> b!457281 (= e!267087 e!267083)))

(assert (=> b!457281 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 lt!206783)))))

(declare-fun lt!206835 () ListLongMap!7067)

(declare-fun res!273035 () Bool)

(assert (=> b!457281 (= res!273035 (contains!2501 lt!206835 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457281 (=> (not res!273035) (not e!267083))))

(declare-fun b!457282 () Bool)

(declare-fun e!267089 () ListLongMap!7067)

(declare-fun call!30098 () ListLongMap!7067)

(assert (=> b!457282 (= e!267089 call!30098)))

(declare-fun b!457283 () Bool)

(assert (=> b!457283 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 lt!206783)))))

(assert (=> b!457283 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13988 lt!206779)))))

(assert (=> b!457283 (= e!267083 (= (apply!314 lt!206835 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863))) (get!6708 (select (arr!13636 lt!206779) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457284 () Bool)

(declare-fun e!267088 () Bool)

(assert (=> b!457284 (= e!267088 e!267087)))

(declare-fun c!56356 () Bool)

(declare-fun e!267086 () Bool)

(assert (=> b!457284 (= c!56356 e!267086)))

(declare-fun res!273033 () Bool)

(assert (=> b!457284 (=> (not res!273033) (not e!267086))))

(assert (=> b!457284 (= res!273033 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13987 lt!206783)))))

(declare-fun b!457286 () Bool)

(declare-fun e!267084 () ListLongMap!7067)

(assert (=> b!457286 (= e!267084 (ListLongMap!7068 Nil!8225))))

(declare-fun b!457287 () Bool)

(assert (=> b!457287 (= e!267086 (validKeyInArray!0 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457287 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!457288 () Bool)

(declare-fun res!273034 () Bool)

(assert (=> b!457288 (=> (not res!273034) (not e!267088))))

(assert (=> b!457288 (= res!273034 (not (contains!2501 lt!206835 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457289 () Bool)

(declare-fun lt!206834 () Unit!13292)

(declare-fun lt!206833 () Unit!13292)

(assert (=> b!457289 (= lt!206834 lt!206833)))

(declare-fun lt!206831 () V!17493)

(declare-fun lt!206829 () (_ BitVec 64))

(declare-fun lt!206830 () ListLongMap!7067)

(declare-fun lt!206832 () (_ BitVec 64))

(assert (=> b!457289 (not (contains!2501 (+!1585 lt!206830 (tuple2!8155 lt!206832 lt!206831)) lt!206829))))

(assert (=> b!457289 (= lt!206833 (addStillNotContains!147 lt!206830 lt!206832 lt!206831 lt!206829))))

(assert (=> b!457289 (= lt!206829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457289 (= lt!206831 (get!6708 (select (arr!13636 lt!206779) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457289 (= lt!206832 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457289 (= lt!206830 call!30098)))

(assert (=> b!457289 (= e!267089 (+!1585 call!30098 (tuple2!8155 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863)) (get!6708 (select (arr!13636 lt!206779) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457290 () Bool)

(assert (=> b!457290 (= e!267085 (isEmpty!561 lt!206835))))

(declare-fun b!457285 () Bool)

(assert (=> b!457285 (= e!267085 (= lt!206835 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74669 () Bool)

(assert (=> d!74669 e!267088))

(declare-fun res!273036 () Bool)

(assert (=> d!74669 (=> (not res!273036) (not e!267088))))

(assert (=> d!74669 (= res!273036 (not (contains!2501 lt!206835 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74669 (= lt!206835 e!267084)))

(declare-fun c!56355 () Bool)

(assert (=> d!74669 (= c!56355 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13987 lt!206783)))))

(assert (=> d!74669 (validMask!0 mask!1025)))

(assert (=> d!74669 (= (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206835)))

(declare-fun b!457291 () Bool)

(assert (=> b!457291 (= e!267084 e!267089)))

(declare-fun c!56358 () Bool)

(assert (=> b!457291 (= c!56358 (validKeyInArray!0 (select (arr!13635 lt!206783) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun bm!30095 () Bool)

(assert (=> bm!30095 (= call!30098 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74669 c!56355) b!457286))

(assert (= (and d!74669 (not c!56355)) b!457291))

(assert (= (and b!457291 c!56358) b!457289))

(assert (= (and b!457291 (not c!56358)) b!457282))

(assert (= (or b!457289 b!457282) bm!30095))

(assert (= (and d!74669 res!273036) b!457288))

(assert (= (and b!457288 res!273034) b!457284))

(assert (= (and b!457284 res!273033) b!457287))

(assert (= (and b!457284 c!56356) b!457281))

(assert (= (and b!457284 (not c!56356)) b!457280))

(assert (= (and b!457281 res!273035) b!457283))

(assert (= (and b!457280 c!56357) b!457285))

(assert (= (and b!457280 (not c!56357)) b!457290))

(declare-fun b_lambda!9695 () Bool)

(assert (=> (not b_lambda!9695) (not b!457283)))

(assert (=> b!457283 t!14059))

(declare-fun b_and!19109 () Bool)

(assert (= b_and!19107 (and (=> t!14059 result!7117) b_and!19109)))

(declare-fun b_lambda!9697 () Bool)

(assert (=> (not b_lambda!9697) (not b!457289)))

(assert (=> b!457289 t!14059))

(declare-fun b_and!19111 () Bool)

(assert (= b_and!19109 (and (=> t!14059 result!7117) b_and!19111)))

(declare-fun m!440625 () Bool)

(assert (=> b!457288 m!440625))

(declare-fun m!440627 () Bool)

(assert (=> b!457287 m!440627))

(assert (=> b!457287 m!440627))

(declare-fun m!440629 () Bool)

(assert (=> b!457287 m!440629))

(declare-fun m!440631 () Bool)

(assert (=> b!457290 m!440631))

(declare-fun m!440633 () Bool)

(assert (=> d!74669 m!440633))

(assert (=> d!74669 m!440517))

(declare-fun m!440635 () Bool)

(assert (=> b!457289 m!440635))

(declare-fun m!440637 () Bool)

(assert (=> b!457289 m!440637))

(declare-fun m!440639 () Bool)

(assert (=> b!457289 m!440639))

(assert (=> b!457289 m!440509))

(assert (=> b!457289 m!440627))

(declare-fun m!440641 () Bool)

(assert (=> b!457289 m!440641))

(assert (=> b!457289 m!440639))

(declare-fun m!440643 () Bool)

(assert (=> b!457289 m!440643))

(assert (=> b!457289 m!440641))

(assert (=> b!457289 m!440509))

(declare-fun m!440645 () Bool)

(assert (=> b!457289 m!440645))

(assert (=> b!457291 m!440627))

(assert (=> b!457291 m!440627))

(assert (=> b!457291 m!440629))

(assert (=> b!457281 m!440627))

(assert (=> b!457281 m!440627))

(declare-fun m!440647 () Bool)

(assert (=> b!457281 m!440647))

(assert (=> b!457283 m!440627))

(declare-fun m!440649 () Bool)

(assert (=> b!457283 m!440649))

(assert (=> b!457283 m!440641))

(assert (=> b!457283 m!440509))

(assert (=> b!457283 m!440645))

(assert (=> b!457283 m!440509))

(assert (=> b!457283 m!440627))

(assert (=> b!457283 m!440641))

(declare-fun m!440651 () Bool)

(assert (=> bm!30095 m!440651))

(assert (=> b!457285 m!440651))

(assert (=> b!457152 d!74669))

(declare-fun d!74671 () Bool)

(declare-fun e!267092 () Bool)

(assert (=> d!74671 e!267092))

(declare-fun res!273041 () Bool)

(assert (=> d!74671 (=> (not res!273041) (not e!267092))))

(declare-fun lt!206845 () ListLongMap!7067)

(assert (=> d!74671 (= res!273041 (contains!2501 lt!206845 (_1!4088 (tuple2!8155 k0!794 v!412))))))

(declare-fun lt!206847 () List!8228)

(assert (=> d!74671 (= lt!206845 (ListLongMap!7068 lt!206847))))

(declare-fun lt!206844 () Unit!13292)

(declare-fun lt!206846 () Unit!13292)

(assert (=> d!74671 (= lt!206844 lt!206846)))

(declare-datatypes ((Option!377 0))(
  ( (Some!376 (v!8461 V!17493)) (None!375) )
))
(declare-fun getValueByKey!371 (List!8228 (_ BitVec 64)) Option!377)

(assert (=> d!74671 (= (getValueByKey!371 lt!206847 (_1!4088 (tuple2!8155 k0!794 v!412))) (Some!376 (_2!4088 (tuple2!8155 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!193 (List!8228 (_ BitVec 64) V!17493) Unit!13292)

(assert (=> d!74671 (= lt!206846 (lemmaContainsTupThenGetReturnValue!193 lt!206847 (_1!4088 (tuple2!8155 k0!794 v!412)) (_2!4088 (tuple2!8155 k0!794 v!412))))))

(declare-fun insertStrictlySorted!196 (List!8228 (_ BitVec 64) V!17493) List!8228)

(assert (=> d!74671 (= lt!206847 (insertStrictlySorted!196 (toList!3549 lt!206778) (_1!4088 (tuple2!8155 k0!794 v!412)) (_2!4088 (tuple2!8155 k0!794 v!412))))))

(assert (=> d!74671 (= (+!1585 lt!206778 (tuple2!8155 k0!794 v!412)) lt!206845)))

(declare-fun b!457296 () Bool)

(declare-fun res!273042 () Bool)

(assert (=> b!457296 (=> (not res!273042) (not e!267092))))

(assert (=> b!457296 (= res!273042 (= (getValueByKey!371 (toList!3549 lt!206845) (_1!4088 (tuple2!8155 k0!794 v!412))) (Some!376 (_2!4088 (tuple2!8155 k0!794 v!412)))))))

(declare-fun b!457297 () Bool)

(declare-fun contains!2502 (List!8228 tuple2!8154) Bool)

(assert (=> b!457297 (= e!267092 (contains!2502 (toList!3549 lt!206845) (tuple2!8155 k0!794 v!412)))))

(assert (= (and d!74671 res!273041) b!457296))

(assert (= (and b!457296 res!273042) b!457297))

(declare-fun m!440653 () Bool)

(assert (=> d!74671 m!440653))

(declare-fun m!440655 () Bool)

(assert (=> d!74671 m!440655))

(declare-fun m!440657 () Bool)

(assert (=> d!74671 m!440657))

(declare-fun m!440659 () Bool)

(assert (=> d!74671 m!440659))

(declare-fun m!440661 () Bool)

(assert (=> b!457296 m!440661))

(declare-fun m!440663 () Bool)

(assert (=> b!457297 m!440663))

(assert (=> b!457152 d!74671))

(declare-fun d!74673 () Bool)

(assert (=> d!74673 (= (validKeyInArray!0 (select (arr!13635 _keys!709) from!863)) (and (not (= (select (arr!13635 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13635 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457152 d!74673))

(declare-fun b!457304 () Bool)

(declare-fun e!267097 () Bool)

(declare-fun e!267098 () Bool)

(assert (=> b!457304 (= e!267097 e!267098)))

(declare-fun c!56361 () Bool)

(assert (=> b!457304 (= c!56361 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun call!30104 () ListLongMap!7067)

(declare-fun call!30103 () ListLongMap!7067)

(declare-fun b!457305 () Bool)

(assert (=> b!457305 (= e!267098 (= call!30104 (+!1585 call!30103 (tuple2!8155 k0!794 v!412))))))

(declare-fun b!457306 () Bool)

(assert (=> b!457306 (= e!267098 (= call!30104 call!30103))))

(declare-fun bm!30100 () Bool)

(assert (=> bm!30100 (= call!30103 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!30101 () Bool)

(assert (=> bm!30101 (= call!30104 (getCurrentListMapNoExtraKeys!1732 (array!28384 (store (arr!13635 _keys!709) i!563 k0!794) (size!13987 _keys!709)) (array!28386 (store (arr!13636 _values!549) i!563 (ValueCellFull!5802 v!412)) (size!13988 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74675 () Bool)

(assert (=> d!74675 e!267097))

(declare-fun res!273045 () Bool)

(assert (=> d!74675 (=> (not res!273045) (not e!267097))))

(assert (=> d!74675 (= res!273045 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13987 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13988 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13987 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13988 _values!549))))))))

(declare-fun lt!206850 () Unit!13292)

(declare-fun choose!1331 (array!28383 array!28385 (_ BitVec 32) (_ BitVec 32) V!17493 V!17493 (_ BitVec 32) (_ BitVec 64) V!17493 (_ BitVec 32) Int) Unit!13292)

(assert (=> d!74675 (= lt!206850 (choose!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74675 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13987 _keys!709)))))

(assert (=> d!74675 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206850)))

(assert (= (and d!74675 res!273045) b!457304))

(assert (= (and b!457304 c!56361) b!457305))

(assert (= (and b!457304 (not c!56361)) b!457306))

(assert (= (or b!457305 b!457306) bm!30100))

(assert (= (or b!457305 b!457306) bm!30101))

(declare-fun m!440665 () Bool)

(assert (=> b!457305 m!440665))

(assert (=> bm!30100 m!440499))

(assert (=> bm!30101 m!440535))

(assert (=> bm!30101 m!440523))

(declare-fun m!440667 () Bool)

(assert (=> bm!30101 m!440667))

(declare-fun m!440669 () Bool)

(assert (=> d!74675 m!440669))

(assert (=> b!457152 d!74675))

(declare-fun d!74677 () Bool)

(assert (=> d!74677 (= (array_inv!9872 _values!549) (bvsge (size!13988 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41018 d!74677))

(declare-fun d!74679 () Bool)

(assert (=> d!74679 (= (array_inv!9873 _keys!709) (bvsge (size!13987 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41018 d!74679))

(declare-fun b!457307 () Bool)

(declare-fun e!267099 () Bool)

(declare-fun call!30105 () Bool)

(assert (=> b!457307 (= e!267099 call!30105)))

(declare-fun b!457308 () Bool)

(declare-fun e!267100 () Bool)

(assert (=> b!457308 (= e!267100 e!267099)))

(declare-fun c!56362 () Bool)

(assert (=> b!457308 (= c!56362 (validKeyInArray!0 (select (arr!13635 lt!206783) #b00000000000000000000000000000000)))))

(declare-fun b!457309 () Bool)

(declare-fun e!267101 () Bool)

(assert (=> b!457309 (= e!267101 e!267100)))

(declare-fun res!273047 () Bool)

(assert (=> b!457309 (=> (not res!273047) (not e!267100))))

(declare-fun e!267102 () Bool)

(assert (=> b!457309 (= res!273047 (not e!267102))))

(declare-fun res!273048 () Bool)

(assert (=> b!457309 (=> (not res!273048) (not e!267102))))

(assert (=> b!457309 (= res!273048 (validKeyInArray!0 (select (arr!13635 lt!206783) #b00000000000000000000000000000000)))))

(declare-fun d!74681 () Bool)

(declare-fun res!273046 () Bool)

(assert (=> d!74681 (=> res!273046 e!267101)))

(assert (=> d!74681 (= res!273046 (bvsge #b00000000000000000000000000000000 (size!13987 lt!206783)))))

(assert (=> d!74681 (= (arrayNoDuplicates!0 lt!206783 #b00000000000000000000000000000000 Nil!8226) e!267101)))

(declare-fun bm!30102 () Bool)

(assert (=> bm!30102 (= call!30105 (arrayNoDuplicates!0 lt!206783 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56362 (Cons!8225 (select (arr!13635 lt!206783) #b00000000000000000000000000000000) Nil!8226) Nil!8226)))))

(declare-fun b!457310 () Bool)

(assert (=> b!457310 (= e!267102 (contains!2500 Nil!8226 (select (arr!13635 lt!206783) #b00000000000000000000000000000000)))))

(declare-fun b!457311 () Bool)

(assert (=> b!457311 (= e!267099 call!30105)))

(assert (= (and d!74681 (not res!273046)) b!457309))

(assert (= (and b!457309 res!273048) b!457310))

(assert (= (and b!457309 res!273047) b!457308))

(assert (= (and b!457308 c!56362) b!457307))

(assert (= (and b!457308 (not c!56362)) b!457311))

(assert (= (or b!457307 b!457311) bm!30102))

(declare-fun m!440671 () Bool)

(assert (=> b!457308 m!440671))

(assert (=> b!457308 m!440671))

(declare-fun m!440673 () Bool)

(assert (=> b!457308 m!440673))

(assert (=> b!457309 m!440671))

(assert (=> b!457309 m!440671))

(assert (=> b!457309 m!440673))

(assert (=> bm!30102 m!440671))

(declare-fun m!440675 () Bool)

(assert (=> bm!30102 m!440675))

(assert (=> b!457310 m!440671))

(assert (=> b!457310 m!440671))

(declare-fun m!440677 () Bool)

(assert (=> b!457310 m!440677))

(assert (=> b!457165 d!74681))

(declare-fun b!457320 () Bool)

(declare-fun e!267109 () Bool)

(declare-fun e!267111 () Bool)

(assert (=> b!457320 (= e!267109 e!267111)))

(declare-fun lt!206858 () (_ BitVec 64))

(assert (=> b!457320 (= lt!206858 (select (arr!13635 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!206857 () Unit!13292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28383 (_ BitVec 64) (_ BitVec 32)) Unit!13292)

(assert (=> b!457320 (= lt!206857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!206858 #b00000000000000000000000000000000))))

(assert (=> b!457320 (arrayContainsKey!0 _keys!709 lt!206858 #b00000000000000000000000000000000)))

(declare-fun lt!206859 () Unit!13292)

(assert (=> b!457320 (= lt!206859 lt!206857)))

(declare-fun res!273053 () Bool)

(declare-datatypes ((SeekEntryResult!3533 0))(
  ( (MissingZero!3533 (index!16311 (_ BitVec 32))) (Found!3533 (index!16312 (_ BitVec 32))) (Intermediate!3533 (undefined!4345 Bool) (index!16313 (_ BitVec 32)) (x!42683 (_ BitVec 32))) (Undefined!3533) (MissingVacant!3533 (index!16314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28383 (_ BitVec 32)) SeekEntryResult!3533)

(assert (=> b!457320 (= res!273053 (= (seekEntryOrOpen!0 (select (arr!13635 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3533 #b00000000000000000000000000000000)))))

(assert (=> b!457320 (=> (not res!273053) (not e!267111))))

(declare-fun bm!30105 () Bool)

(declare-fun call!30108 () Bool)

(assert (=> bm!30105 (= call!30108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!457321 () Bool)

(assert (=> b!457321 (= e!267111 call!30108)))

(declare-fun b!457322 () Bool)

(declare-fun e!267110 () Bool)

(assert (=> b!457322 (= e!267110 e!267109)))

(declare-fun c!56365 () Bool)

(assert (=> b!457322 (= c!56365 (validKeyInArray!0 (select (arr!13635 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74683 () Bool)

(declare-fun res!273054 () Bool)

(assert (=> d!74683 (=> res!273054 e!267110)))

(assert (=> d!74683 (= res!273054 (bvsge #b00000000000000000000000000000000 (size!13987 _keys!709)))))

(assert (=> d!74683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267110)))

(declare-fun b!457323 () Bool)

(assert (=> b!457323 (= e!267109 call!30108)))

(assert (= (and d!74683 (not res!273054)) b!457322))

(assert (= (and b!457322 c!56365) b!457320))

(assert (= (and b!457322 (not c!56365)) b!457323))

(assert (= (and b!457320 res!273053) b!457321))

(assert (= (or b!457321 b!457323) bm!30105))

(assert (=> b!457320 m!440587))

(declare-fun m!440679 () Bool)

(assert (=> b!457320 m!440679))

(declare-fun m!440681 () Bool)

(assert (=> b!457320 m!440681))

(assert (=> b!457320 m!440587))

(declare-fun m!440683 () Bool)

(assert (=> b!457320 m!440683))

(declare-fun m!440685 () Bool)

(assert (=> bm!30105 m!440685))

(assert (=> b!457322 m!440587))

(assert (=> b!457322 m!440587))

(assert (=> b!457322 m!440589))

(assert (=> b!457163 d!74683))

(declare-fun d!74685 () Bool)

(assert (=> d!74685 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!457167 d!74685))

(declare-fun b!457324 () Bool)

(declare-fun e!267112 () Bool)

(declare-fun e!267114 () Bool)

(assert (=> b!457324 (= e!267112 e!267114)))

(declare-fun lt!206861 () (_ BitVec 64))

(assert (=> b!457324 (= lt!206861 (select (arr!13635 lt!206783) #b00000000000000000000000000000000))))

(declare-fun lt!206860 () Unit!13292)

(assert (=> b!457324 (= lt!206860 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!206783 lt!206861 #b00000000000000000000000000000000))))

(assert (=> b!457324 (arrayContainsKey!0 lt!206783 lt!206861 #b00000000000000000000000000000000)))

(declare-fun lt!206862 () Unit!13292)

(assert (=> b!457324 (= lt!206862 lt!206860)))

(declare-fun res!273055 () Bool)

(assert (=> b!457324 (= res!273055 (= (seekEntryOrOpen!0 (select (arr!13635 lt!206783) #b00000000000000000000000000000000) lt!206783 mask!1025) (Found!3533 #b00000000000000000000000000000000)))))

(assert (=> b!457324 (=> (not res!273055) (not e!267114))))

(declare-fun bm!30106 () Bool)

(declare-fun call!30109 () Bool)

(assert (=> bm!30106 (= call!30109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!206783 mask!1025))))

(declare-fun b!457325 () Bool)

(assert (=> b!457325 (= e!267114 call!30109)))

(declare-fun b!457326 () Bool)

(declare-fun e!267113 () Bool)

(assert (=> b!457326 (= e!267113 e!267112)))

(declare-fun c!56366 () Bool)

(assert (=> b!457326 (= c!56366 (validKeyInArray!0 (select (arr!13635 lt!206783) #b00000000000000000000000000000000)))))

(declare-fun d!74687 () Bool)

(declare-fun res!273056 () Bool)

(assert (=> d!74687 (=> res!273056 e!267113)))

(assert (=> d!74687 (= res!273056 (bvsge #b00000000000000000000000000000000 (size!13987 lt!206783)))))

(assert (=> d!74687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206783 mask!1025) e!267113)))

(declare-fun b!457327 () Bool)

(assert (=> b!457327 (= e!267112 call!30109)))

(assert (= (and d!74687 (not res!273056)) b!457326))

(assert (= (and b!457326 c!56366) b!457324))

(assert (= (and b!457326 (not c!56366)) b!457327))

(assert (= (and b!457324 res!273055) b!457325))

(assert (= (or b!457325 b!457327) bm!30106))

(assert (=> b!457324 m!440671))

(declare-fun m!440687 () Bool)

(assert (=> b!457324 m!440687))

(declare-fun m!440689 () Bool)

(assert (=> b!457324 m!440689))

(assert (=> b!457324 m!440671))

(declare-fun m!440691 () Bool)

(assert (=> b!457324 m!440691))

(declare-fun m!440693 () Bool)

(assert (=> bm!30106 m!440693))

(assert (=> b!457326 m!440671))

(assert (=> b!457326 m!440671))

(assert (=> b!457326 m!440673))

(assert (=> b!457166 d!74687))

(declare-fun d!74689 () Bool)

(assert (=> d!74689 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457158 d!74689))

(declare-fun b!457328 () Bool)

(declare-fun e!267119 () Bool)

(declare-fun e!267117 () Bool)

(assert (=> b!457328 (= e!267119 e!267117)))

(declare-fun c!56369 () Bool)

(assert (=> b!457328 (= c!56369 (bvslt from!863 (size!13987 lt!206783)))))

(declare-fun b!457329 () Bool)

(declare-fun e!267115 () Bool)

(assert (=> b!457329 (= e!267119 e!267115)))

(assert (=> b!457329 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13987 lt!206783)))))

(declare-fun lt!206869 () ListLongMap!7067)

(declare-fun res!273059 () Bool)

(assert (=> b!457329 (= res!273059 (contains!2501 lt!206869 (select (arr!13635 lt!206783) from!863)))))

(assert (=> b!457329 (=> (not res!273059) (not e!267115))))

(declare-fun b!457330 () Bool)

(declare-fun e!267121 () ListLongMap!7067)

(declare-fun call!30110 () ListLongMap!7067)

(assert (=> b!457330 (= e!267121 call!30110)))

(declare-fun b!457331 () Bool)

(assert (=> b!457331 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13987 lt!206783)))))

(assert (=> b!457331 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13988 lt!206779)))))

(assert (=> b!457331 (= e!267115 (= (apply!314 lt!206869 (select (arr!13635 lt!206783) from!863)) (get!6708 (select (arr!13636 lt!206779) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457332 () Bool)

(declare-fun e!267120 () Bool)

(assert (=> b!457332 (= e!267120 e!267119)))

(declare-fun c!56368 () Bool)

(declare-fun e!267118 () Bool)

(assert (=> b!457332 (= c!56368 e!267118)))

(declare-fun res!273057 () Bool)

(assert (=> b!457332 (=> (not res!273057) (not e!267118))))

(assert (=> b!457332 (= res!273057 (bvslt from!863 (size!13987 lt!206783)))))

(declare-fun b!457334 () Bool)

(declare-fun e!267116 () ListLongMap!7067)

(assert (=> b!457334 (= e!267116 (ListLongMap!7068 Nil!8225))))

(declare-fun b!457335 () Bool)

(assert (=> b!457335 (= e!267118 (validKeyInArray!0 (select (arr!13635 lt!206783) from!863)))))

(assert (=> b!457335 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!457336 () Bool)

(declare-fun res!273058 () Bool)

(assert (=> b!457336 (=> (not res!273058) (not e!267120))))

(assert (=> b!457336 (= res!273058 (not (contains!2501 lt!206869 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457337 () Bool)

(declare-fun lt!206868 () Unit!13292)

(declare-fun lt!206867 () Unit!13292)

(assert (=> b!457337 (= lt!206868 lt!206867)))

(declare-fun lt!206864 () ListLongMap!7067)

(declare-fun lt!206866 () (_ BitVec 64))

(declare-fun lt!206865 () V!17493)

(declare-fun lt!206863 () (_ BitVec 64))

(assert (=> b!457337 (not (contains!2501 (+!1585 lt!206864 (tuple2!8155 lt!206866 lt!206865)) lt!206863))))

(assert (=> b!457337 (= lt!206867 (addStillNotContains!147 lt!206864 lt!206866 lt!206865 lt!206863))))

(assert (=> b!457337 (= lt!206863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457337 (= lt!206865 (get!6708 (select (arr!13636 lt!206779) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457337 (= lt!206866 (select (arr!13635 lt!206783) from!863))))

(assert (=> b!457337 (= lt!206864 call!30110)))

(assert (=> b!457337 (= e!267121 (+!1585 call!30110 (tuple2!8155 (select (arr!13635 lt!206783) from!863) (get!6708 (select (arr!13636 lt!206779) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457338 () Bool)

(assert (=> b!457338 (= e!267117 (isEmpty!561 lt!206869))))

(declare-fun b!457333 () Bool)

(assert (=> b!457333 (= e!267117 (= lt!206869 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74691 () Bool)

(assert (=> d!74691 e!267120))

(declare-fun res!273060 () Bool)

(assert (=> d!74691 (=> (not res!273060) (not e!267120))))

(assert (=> d!74691 (= res!273060 (not (contains!2501 lt!206869 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74691 (= lt!206869 e!267116)))

(declare-fun c!56367 () Bool)

(assert (=> d!74691 (= c!56367 (bvsge from!863 (size!13987 lt!206783)))))

(assert (=> d!74691 (validMask!0 mask!1025)))

(assert (=> d!74691 (= (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206869)))

(declare-fun b!457339 () Bool)

(assert (=> b!457339 (= e!267116 e!267121)))

(declare-fun c!56370 () Bool)

(assert (=> b!457339 (= c!56370 (validKeyInArray!0 (select (arr!13635 lt!206783) from!863)))))

(declare-fun bm!30107 () Bool)

(assert (=> bm!30107 (= call!30110 (getCurrentListMapNoExtraKeys!1732 lt!206783 lt!206779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74691 c!56367) b!457334))

(assert (= (and d!74691 (not c!56367)) b!457339))

(assert (= (and b!457339 c!56370) b!457337))

(assert (= (and b!457339 (not c!56370)) b!457330))

(assert (= (or b!457337 b!457330) bm!30107))

(assert (= (and d!74691 res!273060) b!457336))

(assert (= (and b!457336 res!273058) b!457332))

(assert (= (and b!457332 res!273057) b!457335))

(assert (= (and b!457332 c!56368) b!457329))

(assert (= (and b!457332 (not c!56368)) b!457328))

(assert (= (and b!457329 res!273059) b!457331))

(assert (= (and b!457328 c!56369) b!457333))

(assert (= (and b!457328 (not c!56369)) b!457338))

(declare-fun b_lambda!9699 () Bool)

(assert (=> (not b_lambda!9699) (not b!457331)))

(assert (=> b!457331 t!14059))

(declare-fun b_and!19113 () Bool)

(assert (= b_and!19111 (and (=> t!14059 result!7117) b_and!19113)))

(declare-fun b_lambda!9701 () Bool)

(assert (=> (not b_lambda!9701) (not b!457337)))

(assert (=> b!457337 t!14059))

(declare-fun b_and!19115 () Bool)

(assert (= b_and!19113 (and (=> t!14059 result!7117) b_and!19115)))

(declare-fun m!440695 () Bool)

(assert (=> b!457336 m!440695))

(declare-fun m!440697 () Bool)

(assert (=> b!457335 m!440697))

(assert (=> b!457335 m!440697))

(declare-fun m!440699 () Bool)

(assert (=> b!457335 m!440699))

(declare-fun m!440701 () Bool)

(assert (=> b!457338 m!440701))

(declare-fun m!440703 () Bool)

(assert (=> d!74691 m!440703))

(assert (=> d!74691 m!440517))

(declare-fun m!440705 () Bool)

(assert (=> b!457337 m!440705))

(declare-fun m!440707 () Bool)

(assert (=> b!457337 m!440707))

(declare-fun m!440709 () Bool)

(assert (=> b!457337 m!440709))

(assert (=> b!457337 m!440509))

(assert (=> b!457337 m!440697))

(declare-fun m!440711 () Bool)

(assert (=> b!457337 m!440711))

(assert (=> b!457337 m!440709))

(declare-fun m!440713 () Bool)

(assert (=> b!457337 m!440713))

(assert (=> b!457337 m!440711))

(assert (=> b!457337 m!440509))

(declare-fun m!440715 () Bool)

(assert (=> b!457337 m!440715))

(assert (=> b!457339 m!440697))

(assert (=> b!457339 m!440697))

(assert (=> b!457339 m!440699))

(assert (=> b!457329 m!440697))

(assert (=> b!457329 m!440697))

(declare-fun m!440717 () Bool)

(assert (=> b!457329 m!440717))

(assert (=> b!457331 m!440697))

(declare-fun m!440719 () Bool)

(assert (=> b!457331 m!440719))

(assert (=> b!457331 m!440711))

(assert (=> b!457331 m!440509))

(assert (=> b!457331 m!440715))

(assert (=> b!457331 m!440509))

(assert (=> b!457331 m!440697))

(assert (=> b!457331 m!440711))

(declare-fun m!440721 () Bool)

(assert (=> bm!30107 m!440721))

(assert (=> b!457333 m!440721))

(assert (=> b!457160 d!74691))

(declare-fun b!457340 () Bool)

(declare-fun e!267126 () Bool)

(declare-fun e!267124 () Bool)

(assert (=> b!457340 (= e!267126 e!267124)))

(declare-fun c!56373 () Bool)

(assert (=> b!457340 (= c!56373 (bvslt from!863 (size!13987 _keys!709)))))

(declare-fun b!457341 () Bool)

(declare-fun e!267122 () Bool)

(assert (=> b!457341 (= e!267126 e!267122)))

(assert (=> b!457341 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13987 _keys!709)))))

(declare-fun res!273063 () Bool)

(declare-fun lt!206876 () ListLongMap!7067)

(assert (=> b!457341 (= res!273063 (contains!2501 lt!206876 (select (arr!13635 _keys!709) from!863)))))

(assert (=> b!457341 (=> (not res!273063) (not e!267122))))

(declare-fun b!457342 () Bool)

(declare-fun e!267128 () ListLongMap!7067)

(declare-fun call!30111 () ListLongMap!7067)

(assert (=> b!457342 (= e!267128 call!30111)))

(declare-fun b!457343 () Bool)

(assert (=> b!457343 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13987 _keys!709)))))

(assert (=> b!457343 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13988 _values!549)))))

(assert (=> b!457343 (= e!267122 (= (apply!314 lt!206876 (select (arr!13635 _keys!709) from!863)) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457344 () Bool)

(declare-fun e!267127 () Bool)

(assert (=> b!457344 (= e!267127 e!267126)))

(declare-fun c!56372 () Bool)

(declare-fun e!267125 () Bool)

(assert (=> b!457344 (= c!56372 e!267125)))

(declare-fun res!273061 () Bool)

(assert (=> b!457344 (=> (not res!273061) (not e!267125))))

(assert (=> b!457344 (= res!273061 (bvslt from!863 (size!13987 _keys!709)))))

(declare-fun b!457346 () Bool)

(declare-fun e!267123 () ListLongMap!7067)

(assert (=> b!457346 (= e!267123 (ListLongMap!7068 Nil!8225))))

(declare-fun b!457347 () Bool)

(assert (=> b!457347 (= e!267125 (validKeyInArray!0 (select (arr!13635 _keys!709) from!863)))))

(assert (=> b!457347 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!457348 () Bool)

(declare-fun res!273062 () Bool)

(assert (=> b!457348 (=> (not res!273062) (not e!267127))))

(assert (=> b!457348 (= res!273062 (not (contains!2501 lt!206876 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457349 () Bool)

(declare-fun lt!206875 () Unit!13292)

(declare-fun lt!206874 () Unit!13292)

(assert (=> b!457349 (= lt!206875 lt!206874)))

(declare-fun lt!206870 () (_ BitVec 64))

(declare-fun lt!206873 () (_ BitVec 64))

(declare-fun lt!206872 () V!17493)

(declare-fun lt!206871 () ListLongMap!7067)

(assert (=> b!457349 (not (contains!2501 (+!1585 lt!206871 (tuple2!8155 lt!206873 lt!206872)) lt!206870))))

(assert (=> b!457349 (= lt!206874 (addStillNotContains!147 lt!206871 lt!206873 lt!206872 lt!206870))))

(assert (=> b!457349 (= lt!206870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457349 (= lt!206872 (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457349 (= lt!206873 (select (arr!13635 _keys!709) from!863))))

(assert (=> b!457349 (= lt!206871 call!30111)))

(assert (=> b!457349 (= e!267128 (+!1585 call!30111 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457350 () Bool)

(assert (=> b!457350 (= e!267124 (isEmpty!561 lt!206876))))

(declare-fun b!457345 () Bool)

(assert (=> b!457345 (= e!267124 (= lt!206876 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74693 () Bool)

(assert (=> d!74693 e!267127))

(declare-fun res!273064 () Bool)

(assert (=> d!74693 (=> (not res!273064) (not e!267127))))

(assert (=> d!74693 (= res!273064 (not (contains!2501 lt!206876 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74693 (= lt!206876 e!267123)))

(declare-fun c!56371 () Bool)

(assert (=> d!74693 (= c!56371 (bvsge from!863 (size!13987 _keys!709)))))

(assert (=> d!74693 (validMask!0 mask!1025)))

(assert (=> d!74693 (= (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206876)))

(declare-fun b!457351 () Bool)

(assert (=> b!457351 (= e!267123 e!267128)))

(declare-fun c!56374 () Bool)

(assert (=> b!457351 (= c!56374 (validKeyInArray!0 (select (arr!13635 _keys!709) from!863)))))

(declare-fun bm!30108 () Bool)

(assert (=> bm!30108 (= call!30111 (getCurrentListMapNoExtraKeys!1732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(assert (= (and d!74693 c!56371) b!457346))

(assert (= (and d!74693 (not c!56371)) b!457351))

(assert (= (and b!457351 c!56374) b!457349))

(assert (= (and b!457351 (not c!56374)) b!457342))

(assert (= (or b!457349 b!457342) bm!30108))

(assert (= (and d!74693 res!273064) b!457348))

(assert (= (and b!457348 res!273062) b!457344))

(assert (= (and b!457344 res!273061) b!457347))

(assert (= (and b!457344 c!56372) b!457341))

(assert (= (and b!457344 (not c!56372)) b!457340))

(assert (= (and b!457341 res!273063) b!457343))

(assert (= (and b!457340 c!56373) b!457345))

(assert (= (and b!457340 (not c!56373)) b!457350))

(declare-fun b_lambda!9703 () Bool)

(assert (=> (not b_lambda!9703) (not b!457343)))

(assert (=> b!457343 t!14059))

(declare-fun b_and!19117 () Bool)

(assert (= b_and!19115 (and (=> t!14059 result!7117) b_and!19117)))

(declare-fun b_lambda!9705 () Bool)

(assert (=> (not b_lambda!9705) (not b!457349)))

(assert (=> b!457349 t!14059))

(declare-fun b_and!19119 () Bool)

(assert (= b_and!19117 (and (=> t!14059 result!7117) b_and!19119)))

(declare-fun m!440723 () Bool)

(assert (=> b!457348 m!440723))

(assert (=> b!457347 m!440493))

(assert (=> b!457347 m!440493))

(assert (=> b!457347 m!440501))

(declare-fun m!440725 () Bool)

(assert (=> b!457350 m!440725))

(declare-fun m!440727 () Bool)

(assert (=> d!74693 m!440727))

(assert (=> d!74693 m!440517))

(declare-fun m!440729 () Bool)

(assert (=> b!457349 m!440729))

(declare-fun m!440731 () Bool)

(assert (=> b!457349 m!440731))

(declare-fun m!440733 () Bool)

(assert (=> b!457349 m!440733))

(assert (=> b!457349 m!440509))

(assert (=> b!457349 m!440493))

(assert (=> b!457349 m!440513))

(assert (=> b!457349 m!440733))

(declare-fun m!440735 () Bool)

(assert (=> b!457349 m!440735))

(assert (=> b!457349 m!440513))

(assert (=> b!457349 m!440509))

(assert (=> b!457349 m!440515))

(assert (=> b!457351 m!440493))

(assert (=> b!457351 m!440493))

(assert (=> b!457351 m!440501))

(assert (=> b!457341 m!440493))

(assert (=> b!457341 m!440493))

(declare-fun m!440737 () Bool)

(assert (=> b!457341 m!440737))

(assert (=> b!457343 m!440493))

(declare-fun m!440739 () Bool)

(assert (=> b!457343 m!440739))

(assert (=> b!457343 m!440513))

(assert (=> b!457343 m!440509))

(assert (=> b!457343 m!440515))

(assert (=> b!457343 m!440509))

(assert (=> b!457343 m!440493))

(assert (=> b!457343 m!440513))

(declare-fun m!440741 () Bool)

(assert (=> bm!30108 m!440741))

(assert (=> b!457345 m!440741))

(assert (=> b!457160 d!74693))

(declare-fun d!74695 () Bool)

(declare-fun e!267129 () Bool)

(assert (=> d!74695 e!267129))

(declare-fun res!273065 () Bool)

(assert (=> d!74695 (=> (not res!273065) (not e!267129))))

(declare-fun lt!206878 () ListLongMap!7067)

(assert (=> d!74695 (= res!273065 (contains!2501 lt!206878 (_1!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!206880 () List!8228)

(assert (=> d!74695 (= lt!206878 (ListLongMap!7068 lt!206880))))

(declare-fun lt!206877 () Unit!13292)

(declare-fun lt!206879 () Unit!13292)

(assert (=> d!74695 (= lt!206877 lt!206879)))

(assert (=> d!74695 (= (getValueByKey!371 lt!206880 (_1!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74695 (= lt!206879 (lemmaContainsTupThenGetReturnValue!193 lt!206880 (_1!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74695 (= lt!206880 (insertStrictlySorted!196 (toList!3549 lt!206776) (_1!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74695 (= (+!1585 lt!206776 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!206878)))

(declare-fun b!457352 () Bool)

(declare-fun res!273066 () Bool)

(assert (=> b!457352 (=> (not res!273066) (not e!267129))))

(assert (=> b!457352 (= res!273066 (= (getValueByKey!371 (toList!3549 lt!206878) (_1!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!4088 (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!457353 () Bool)

(assert (=> b!457353 (= e!267129 (contains!2502 (toList!3549 lt!206878) (tuple2!8155 (select (arr!13635 _keys!709) from!863) (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74695 res!273065) b!457352))

(assert (= (and b!457352 res!273066) b!457353))

(declare-fun m!440743 () Bool)

(assert (=> d!74695 m!440743))

(declare-fun m!440745 () Bool)

(assert (=> d!74695 m!440745))

(declare-fun m!440747 () Bool)

(assert (=> d!74695 m!440747))

(declare-fun m!440749 () Bool)

(assert (=> d!74695 m!440749))

(declare-fun m!440751 () Bool)

(assert (=> b!457352 m!440751))

(declare-fun m!440753 () Bool)

(assert (=> b!457353 m!440753))

(assert (=> b!457159 d!74695))

(declare-fun d!74697 () Bool)

(declare-fun c!56377 () Bool)

(assert (=> d!74697 (= c!56377 ((_ is ValueCellFull!5802) (select (arr!13636 _values!549) from!863)))))

(declare-fun e!267132 () V!17493)

(assert (=> d!74697 (= (get!6708 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267132)))

(declare-fun b!457358 () Bool)

(declare-fun get!6709 (ValueCell!5802 V!17493) V!17493)

(assert (=> b!457358 (= e!267132 (get!6709 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457359 () Bool)

(declare-fun get!6710 (ValueCell!5802 V!17493) V!17493)

(assert (=> b!457359 (= e!267132 (get!6710 (select (arr!13636 _values!549) from!863) (dynLambda!876 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74697 c!56377) b!457358))

(assert (= (and d!74697 (not c!56377)) b!457359))

(assert (=> b!457358 m!440513))

(assert (=> b!457358 m!440509))

(declare-fun m!440755 () Bool)

(assert (=> b!457358 m!440755))

(assert (=> b!457359 m!440513))

(assert (=> b!457359 m!440509))

(declare-fun m!440757 () Bool)

(assert (=> b!457359 m!440757))

(assert (=> b!457159 d!74697))

(declare-fun condMapEmpty!20083 () Bool)

(declare-fun mapDefault!20083 () ValueCell!5802)

(assert (=> mapNonEmpty!20077 (= condMapEmpty!20083 (= mapRest!20077 ((as const (Array (_ BitVec 32) ValueCell!5802)) mapDefault!20083)))))

(declare-fun e!267138 () Bool)

(declare-fun mapRes!20083 () Bool)

(assert (=> mapNonEmpty!20077 (= tp!38686 (and e!267138 mapRes!20083))))

(declare-fun mapNonEmpty!20083 () Bool)

(declare-fun tp!38695 () Bool)

(declare-fun e!267137 () Bool)

(assert (=> mapNonEmpty!20083 (= mapRes!20083 (and tp!38695 e!267137))))

(declare-fun mapKey!20083 () (_ BitVec 32))

(declare-fun mapValue!20083 () ValueCell!5802)

(declare-fun mapRest!20083 () (Array (_ BitVec 32) ValueCell!5802))

(assert (=> mapNonEmpty!20083 (= mapRest!20077 (store mapRest!20083 mapKey!20083 mapValue!20083))))

(declare-fun mapIsEmpty!20083 () Bool)

(assert (=> mapIsEmpty!20083 mapRes!20083))

(declare-fun b!457366 () Bool)

(assert (=> b!457366 (= e!267137 tp_is_empty!12291)))

(declare-fun b!457367 () Bool)

(assert (=> b!457367 (= e!267138 tp_is_empty!12291)))

(assert (= (and mapNonEmpty!20077 condMapEmpty!20083) mapIsEmpty!20083))

(assert (= (and mapNonEmpty!20077 (not condMapEmpty!20083)) mapNonEmpty!20083))

(assert (= (and mapNonEmpty!20083 ((_ is ValueCellFull!5802) mapValue!20083)) b!457366))

(assert (= (and mapNonEmpty!20077 ((_ is ValueCellFull!5802) mapDefault!20083)) b!457367))

(declare-fun m!440759 () Bool)

(assert (=> mapNonEmpty!20083 m!440759))

(declare-fun b_lambda!9707 () Bool)

(assert (= b_lambda!9701 (or (and start!41018 b_free!10953) b_lambda!9707)))

(declare-fun b_lambda!9709 () Bool)

(assert (= b_lambda!9695 (or (and start!41018 b_free!10953) b_lambda!9709)))

(declare-fun b_lambda!9711 () Bool)

(assert (= b_lambda!9705 (or (and start!41018 b_free!10953) b_lambda!9711)))

(declare-fun b_lambda!9713 () Bool)

(assert (= b_lambda!9699 (or (and start!41018 b_free!10953) b_lambda!9713)))

(declare-fun b_lambda!9715 () Bool)

(assert (= b_lambda!9693 (or (and start!41018 b_free!10953) b_lambda!9715)))

(declare-fun b_lambda!9717 () Bool)

(assert (= b_lambda!9697 (or (and start!41018 b_free!10953) b_lambda!9717)))

(declare-fun b_lambda!9719 () Bool)

(assert (= b_lambda!9703 (or (and start!41018 b_free!10953) b_lambda!9719)))

(declare-fun b_lambda!9721 () Bool)

(assert (= b_lambda!9691 (or (and start!41018 b_free!10953) b_lambda!9721)))

(check-sat (not b!457283) (not b!457310) tp_is_empty!12291 (not b!457339) (not b!457297) (not d!74675) (not b!457349) (not bm!30107) (not b!457278) (not b!457333) (not b_next!10953) (not b_lambda!9707) (not b_lambda!9711) (not b_lambda!9715) (not b!457277) (not b_lambda!9717) (not d!74671) (not b!457320) (not b_lambda!9713) (not b!457347) (not b!457290) (not b!457322) b_and!19119 (not b!457309) (not b!457275) (not b!457337) (not b_lambda!9719) (not b_lambda!9721) (not bm!30101) (not b!457296) (not b!457291) (not bm!30100) (not b!457285) (not mapNonEmpty!20083) (not b!457234) (not b!457269) (not b!457289) (not bm!30095) (not b_lambda!9689) (not d!74669) (not b!457338) (not b!457329) (not b!457358) (not b!457353) (not b!457350) (not b!457235) (not b!457343) (not d!74695) (not b!457324) (not b!457281) (not bm!30091) (not d!74693) (not b!457335) (not b!457345) (not bm!30102) (not b!457348) (not b!457326) (not bm!30106) (not bm!30094) (not b!457276) (not b!457287) (not b!457359) (not b!457279) (not b!457352) (not b!457336) (not b!457351) (not b!457341) (not b!457308) (not b!457236) (not b!457288) (not d!74667) (not bm!30108) (not b!457331) (not b!457305) (not b_lambda!9709) (not d!74691) (not b!457243) (not bm!30105) (not b!457273) (not b!457271))
(check-sat b_and!19119 (not b_next!10953))
