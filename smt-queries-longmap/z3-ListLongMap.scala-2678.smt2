; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39888 () Bool)

(assert start!39888)

(declare-fun b_free!10155 () Bool)

(declare-fun b_next!10155 () Bool)

(assert (=> start!39888 (= b_free!10155 (not b_next!10155))))

(declare-fun tp!35993 () Bool)

(declare-fun b_and!17969 () Bool)

(assert (=> start!39888 (= tp!35993 b_and!17969)))

(declare-fun b!432006 () Bool)

(declare-fun res!254058 () Bool)

(declare-fun e!255590 () Bool)

(assert (=> b!432006 (=> (not res!254058) (not e!255590))))

(declare-datatypes ((array!26447 0))(
  ( (array!26448 (arr!12673 (Array (_ BitVec 32) (_ BitVec 64))) (size!13025 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26447)

(declare-datatypes ((List!7531 0))(
  ( (Nil!7528) (Cons!7527 (h!8383 (_ BitVec 64)) (t!13135 List!7531)) )
))
(declare-fun arrayNoDuplicates!0 (array!26447 (_ BitVec 32) List!7531) Bool)

(assert (=> b!432006 (= res!254058 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun b!432007 () Bool)

(declare-fun e!255589 () Bool)

(declare-fun e!255583 () Bool)

(assert (=> b!432007 (= e!255589 (not e!255583))))

(declare-fun res!254056 () Bool)

(assert (=> b!432007 (=> res!254056 e!255583)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432007 (= res!254056 (not (validKeyInArray!0 (select (arr!12673 _keys!709) from!863))))))

(declare-datatypes ((V!16181 0))(
  ( (V!16182 (val!5698 Int)) )
))
(declare-datatypes ((tuple2!7516 0))(
  ( (tuple2!7517 (_1!3769 (_ BitVec 64)) (_2!3769 V!16181)) )
))
(declare-datatypes ((List!7532 0))(
  ( (Nil!7529) (Cons!7528 (h!8384 tuple2!7516) (t!13136 List!7532)) )
))
(declare-datatypes ((ListLongMap!6429 0))(
  ( (ListLongMap!6430 (toList!3230 List!7532)) )
))
(declare-fun lt!198000 () ListLongMap!6429)

(declare-fun lt!198002 () ListLongMap!6429)

(assert (=> b!432007 (= lt!198000 lt!198002)))

(declare-fun lt!197993 () ListLongMap!6429)

(declare-fun lt!197996 () tuple2!7516)

(declare-fun +!1378 (ListLongMap!6429 tuple2!7516) ListLongMap!6429)

(assert (=> b!432007 (= lt!198002 (+!1378 lt!197993 lt!197996))))

(declare-fun minValue!515 () V!16181)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16181)

(declare-datatypes ((ValueCell!5310 0))(
  ( (ValueCellFull!5310 (v!7945 V!16181)) (EmptyCell!5310) )
))
(declare-datatypes ((array!26449 0))(
  ( (array!26450 (arr!12674 (Array (_ BitVec 32) ValueCell!5310)) (size!13026 (_ BitVec 32))) )
))
(declare-fun lt!197998 () array!26449)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!197999 () array!26447)

(declare-fun getCurrentListMapNoExtraKeys!1428 (array!26447 array!26449 (_ BitVec 32) (_ BitVec 32) V!16181 V!16181 (_ BitVec 32) Int) ListLongMap!6429)

(assert (=> b!432007 (= lt!198000 (getCurrentListMapNoExtraKeys!1428 lt!197999 lt!197998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16181)

(assert (=> b!432007 (= lt!197996 (tuple2!7517 k0!794 v!412))))

(declare-fun _values!549 () array!26449)

(assert (=> b!432007 (= lt!197993 (getCurrentListMapNoExtraKeys!1428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12747 0))(
  ( (Unit!12748) )
))
(declare-fun lt!197995 () Unit!12747)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 (array!26447 array!26449 (_ BitVec 32) (_ BitVec 32) V!16181 V!16181 (_ BitVec 32) (_ BitVec 64) V!16181 (_ BitVec 32) Int) Unit!12747)

(assert (=> b!432007 (= lt!197995 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432008 () Bool)

(declare-fun res!254057 () Bool)

(assert (=> b!432008 (=> (not res!254057) (not e!255590))))

(declare-fun arrayContainsKey!0 (array!26447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432008 (= res!254057 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!254059 () Bool)

(assert (=> start!39888 (=> (not res!254059) (not e!255590))))

(assert (=> start!39888 (= res!254059 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13025 _keys!709))))))

(assert (=> start!39888 e!255590))

(declare-fun tp_is_empty!11307 () Bool)

(assert (=> start!39888 tp_is_empty!11307))

(assert (=> start!39888 tp!35993))

(assert (=> start!39888 true))

(declare-fun e!255584 () Bool)

(declare-fun array_inv!9220 (array!26449) Bool)

(assert (=> start!39888 (and (array_inv!9220 _values!549) e!255584)))

(declare-fun array_inv!9221 (array!26447) Bool)

(assert (=> start!39888 (array_inv!9221 _keys!709)))

(declare-fun mapNonEmpty!18582 () Bool)

(declare-fun mapRes!18582 () Bool)

(declare-fun tp!35994 () Bool)

(declare-fun e!255591 () Bool)

(assert (=> mapNonEmpty!18582 (= mapRes!18582 (and tp!35994 e!255591))))

(declare-fun mapRest!18582 () (Array (_ BitVec 32) ValueCell!5310))

(declare-fun mapKey!18582 () (_ BitVec 32))

(declare-fun mapValue!18582 () ValueCell!5310)

(assert (=> mapNonEmpty!18582 (= (arr!12674 _values!549) (store mapRest!18582 mapKey!18582 mapValue!18582))))

(declare-fun b!432009 () Bool)

(declare-fun res!254068 () Bool)

(assert (=> b!432009 (=> (not res!254068) (not e!255590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432009 (= res!254068 (validMask!0 mask!1025))))

(declare-fun b!432010 () Bool)

(declare-fun res!254060 () Bool)

(assert (=> b!432010 (=> (not res!254060) (not e!255590))))

(assert (=> b!432010 (= res!254060 (and (= (size!13026 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13025 _keys!709) (size!13026 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432011 () Bool)

(declare-fun res!254062 () Bool)

(declare-fun e!255588 () Bool)

(assert (=> b!432011 (=> (not res!254062) (not e!255588))))

(assert (=> b!432011 (= res!254062 (bvsle from!863 i!563))))

(declare-fun b!432012 () Bool)

(declare-fun e!255582 () Bool)

(assert (=> b!432012 (= e!255584 (and e!255582 mapRes!18582))))

(declare-fun condMapEmpty!18582 () Bool)

(declare-fun mapDefault!18582 () ValueCell!5310)

(assert (=> b!432012 (= condMapEmpty!18582 (= (arr!12674 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5310)) mapDefault!18582)))))

(declare-fun b!432013 () Bool)

(declare-fun e!255586 () Unit!12747)

(declare-fun Unit!12749 () Unit!12747)

(assert (=> b!432013 (= e!255586 Unit!12749)))

(declare-fun lt!198003 () Unit!12747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12747)

(assert (=> b!432013 (= lt!198003 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432013 false))

(declare-fun b!432014 () Bool)

(declare-fun e!255585 () Bool)

(assert (=> b!432014 (= e!255585 true)))

(declare-fun lt!198005 () ListLongMap!6429)

(declare-fun lt!197994 () tuple2!7516)

(assert (=> b!432014 (= lt!198005 (+!1378 (+!1378 lt!197993 lt!197994) lt!197996))))

(declare-fun lt!197997 () Unit!12747)

(declare-fun lt!198001 () V!16181)

(declare-fun addCommutativeForDiffKeys!369 (ListLongMap!6429 (_ BitVec 64) V!16181 (_ BitVec 64) V!16181) Unit!12747)

(assert (=> b!432014 (= lt!197997 (addCommutativeForDiffKeys!369 lt!197993 k0!794 v!412 (select (arr!12673 _keys!709) from!863) lt!198001))))

(declare-fun b!432015 () Bool)

(declare-fun Unit!12750 () Unit!12747)

(assert (=> b!432015 (= e!255586 Unit!12750)))

(declare-fun b!432016 () Bool)

(assert (=> b!432016 (= e!255588 e!255589)))

(declare-fun res!254066 () Bool)

(assert (=> b!432016 (=> (not res!254066) (not e!255589))))

(assert (=> b!432016 (= res!254066 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197992 () ListLongMap!6429)

(assert (=> b!432016 (= lt!197992 (getCurrentListMapNoExtraKeys!1428 lt!197999 lt!197998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432016 (= lt!197998 (array!26450 (store (arr!12674 _values!549) i!563 (ValueCellFull!5310 v!412)) (size!13026 _values!549)))))

(declare-fun lt!198004 () ListLongMap!6429)

(assert (=> b!432016 (= lt!198004 (getCurrentListMapNoExtraKeys!1428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432017 () Bool)

(declare-fun res!254067 () Bool)

(assert (=> b!432017 (=> (not res!254067) (not e!255590))))

(assert (=> b!432017 (= res!254067 (validKeyInArray!0 k0!794))))

(declare-fun b!432018 () Bool)

(declare-fun res!254064 () Bool)

(assert (=> b!432018 (=> (not res!254064) (not e!255590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26447 (_ BitVec 32)) Bool)

(assert (=> b!432018 (= res!254064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432019 () Bool)

(assert (=> b!432019 (= e!255583 e!255585)))

(declare-fun res!254069 () Bool)

(assert (=> b!432019 (=> res!254069 e!255585)))

(assert (=> b!432019 (= res!254069 (= k0!794 (select (arr!12673 _keys!709) from!863)))))

(assert (=> b!432019 (not (= (select (arr!12673 _keys!709) from!863) k0!794))))

(declare-fun lt!197991 () Unit!12747)

(assert (=> b!432019 (= lt!197991 e!255586)))

(declare-fun c!55568 () Bool)

(assert (=> b!432019 (= c!55568 (= (select (arr!12673 _keys!709) from!863) k0!794))))

(assert (=> b!432019 (= lt!197992 lt!198005)))

(assert (=> b!432019 (= lt!198005 (+!1378 lt!198002 lt!197994))))

(assert (=> b!432019 (= lt!197994 (tuple2!7517 (select (arr!12673 _keys!709) from!863) lt!198001))))

(declare-fun get!6298 (ValueCell!5310 V!16181) V!16181)

(declare-fun dynLambda!799 (Int (_ BitVec 64)) V!16181)

(assert (=> b!432019 (= lt!198001 (get!6298 (select (arr!12674 _values!549) from!863) (dynLambda!799 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432020 () Bool)

(declare-fun res!254065 () Bool)

(assert (=> b!432020 (=> (not res!254065) (not e!255590))))

(assert (=> b!432020 (= res!254065 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13025 _keys!709))))))

(declare-fun b!432021 () Bool)

(declare-fun res!254070 () Bool)

(assert (=> b!432021 (=> (not res!254070) (not e!255588))))

(assert (=> b!432021 (= res!254070 (arrayNoDuplicates!0 lt!197999 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun mapIsEmpty!18582 () Bool)

(assert (=> mapIsEmpty!18582 mapRes!18582))

(declare-fun b!432022 () Bool)

(assert (=> b!432022 (= e!255591 tp_is_empty!11307)))

(declare-fun b!432023 () Bool)

(assert (=> b!432023 (= e!255590 e!255588)))

(declare-fun res!254063 () Bool)

(assert (=> b!432023 (=> (not res!254063) (not e!255588))))

(assert (=> b!432023 (= res!254063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197999 mask!1025))))

(assert (=> b!432023 (= lt!197999 (array!26448 (store (arr!12673 _keys!709) i!563 k0!794) (size!13025 _keys!709)))))

(declare-fun b!432024 () Bool)

(assert (=> b!432024 (= e!255582 tp_is_empty!11307)))

(declare-fun b!432025 () Bool)

(declare-fun res!254061 () Bool)

(assert (=> b!432025 (=> (not res!254061) (not e!255590))))

(assert (=> b!432025 (= res!254061 (or (= (select (arr!12673 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12673 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39888 res!254059) b!432009))

(assert (= (and b!432009 res!254068) b!432010))

(assert (= (and b!432010 res!254060) b!432018))

(assert (= (and b!432018 res!254064) b!432006))

(assert (= (and b!432006 res!254058) b!432020))

(assert (= (and b!432020 res!254065) b!432017))

(assert (= (and b!432017 res!254067) b!432025))

(assert (= (and b!432025 res!254061) b!432008))

(assert (= (and b!432008 res!254057) b!432023))

(assert (= (and b!432023 res!254063) b!432021))

(assert (= (and b!432021 res!254070) b!432011))

(assert (= (and b!432011 res!254062) b!432016))

(assert (= (and b!432016 res!254066) b!432007))

(assert (= (and b!432007 (not res!254056)) b!432019))

(assert (= (and b!432019 c!55568) b!432013))

(assert (= (and b!432019 (not c!55568)) b!432015))

(assert (= (and b!432019 (not res!254069)) b!432014))

(assert (= (and b!432012 condMapEmpty!18582) mapIsEmpty!18582))

(assert (= (and b!432012 (not condMapEmpty!18582)) mapNonEmpty!18582))

(get-info :version)

(assert (= (and mapNonEmpty!18582 ((_ is ValueCellFull!5310) mapValue!18582)) b!432022))

(assert (= (and b!432012 ((_ is ValueCellFull!5310) mapDefault!18582)) b!432024))

(assert (= start!39888 b!432012))

(declare-fun b_lambda!9243 () Bool)

(assert (=> (not b_lambda!9243) (not b!432019)))

(declare-fun t!13134 () Bool)

(declare-fun tb!3561 () Bool)

(assert (=> (and start!39888 (= defaultEntry!557 defaultEntry!557) t!13134) tb!3561))

(declare-fun result!6649 () Bool)

(assert (=> tb!3561 (= result!6649 tp_is_empty!11307)))

(assert (=> b!432019 t!13134))

(declare-fun b_and!17971 () Bool)

(assert (= b_and!17969 (and (=> t!13134 result!6649) b_and!17971)))

(declare-fun m!420115 () Bool)

(assert (=> b!432023 m!420115))

(declare-fun m!420117 () Bool)

(assert (=> b!432023 m!420117))

(declare-fun m!420119 () Bool)

(assert (=> b!432025 m!420119))

(declare-fun m!420121 () Bool)

(assert (=> b!432009 m!420121))

(declare-fun m!420123 () Bool)

(assert (=> b!432007 m!420123))

(declare-fun m!420125 () Bool)

(assert (=> b!432007 m!420125))

(assert (=> b!432007 m!420123))

(declare-fun m!420127 () Bool)

(assert (=> b!432007 m!420127))

(declare-fun m!420129 () Bool)

(assert (=> b!432007 m!420129))

(declare-fun m!420131 () Bool)

(assert (=> b!432007 m!420131))

(declare-fun m!420133 () Bool)

(assert (=> b!432007 m!420133))

(declare-fun m!420135 () Bool)

(assert (=> b!432017 m!420135))

(declare-fun m!420137 () Bool)

(assert (=> b!432018 m!420137))

(declare-fun m!420139 () Bool)

(assert (=> b!432021 m!420139))

(declare-fun m!420141 () Bool)

(assert (=> b!432006 m!420141))

(declare-fun m!420143 () Bool)

(assert (=> b!432014 m!420143))

(assert (=> b!432014 m!420143))

(declare-fun m!420145 () Bool)

(assert (=> b!432014 m!420145))

(assert (=> b!432014 m!420123))

(assert (=> b!432014 m!420123))

(declare-fun m!420147 () Bool)

(assert (=> b!432014 m!420147))

(declare-fun m!420149 () Bool)

(assert (=> mapNonEmpty!18582 m!420149))

(assert (=> b!432019 m!420123))

(declare-fun m!420151 () Bool)

(assert (=> b!432019 m!420151))

(declare-fun m!420153 () Bool)

(assert (=> b!432019 m!420153))

(declare-fun m!420155 () Bool)

(assert (=> b!432019 m!420155))

(assert (=> b!432019 m!420155))

(assert (=> b!432019 m!420151))

(declare-fun m!420157 () Bool)

(assert (=> b!432019 m!420157))

(declare-fun m!420159 () Bool)

(assert (=> b!432016 m!420159))

(declare-fun m!420161 () Bool)

(assert (=> b!432016 m!420161))

(declare-fun m!420163 () Bool)

(assert (=> b!432016 m!420163))

(declare-fun m!420165 () Bool)

(assert (=> b!432013 m!420165))

(declare-fun m!420167 () Bool)

(assert (=> b!432008 m!420167))

(declare-fun m!420169 () Bool)

(assert (=> start!39888 m!420169))

(declare-fun m!420171 () Bool)

(assert (=> start!39888 m!420171))

(check-sat (not b!432021) (not mapNonEmpty!18582) (not b!432016) (not b_lambda!9243) (not b!432014) (not b!432023) b_and!17971 (not b!432008) (not b_next!10155) (not b!432018) (not b!432019) (not start!39888) (not b!432017) (not b!432007) (not b!432006) (not b!432009) tp_is_empty!11307 (not b!432013))
(check-sat b_and!17971 (not b_next!10155))
