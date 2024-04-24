; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41122 () Bool)

(assert start!41122)

(declare-fun b_free!11005 () Bool)

(declare-fun b_next!11005 () Bool)

(assert (=> start!41122 (= b_free!11005 (not b_next!11005))))

(declare-fun tp!38851 () Bool)

(declare-fun b_and!19259 () Bool)

(assert (=> start!41122 (= tp!38851 b_and!19259)))

(declare-fun b!458927 () Bool)

(declare-fun res!274240 () Bool)

(declare-fun e!267910 () Bool)

(assert (=> b!458927 (=> (not res!274240) (not e!267910))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458927 (= res!274240 (validKeyInArray!0 k0!794))))

(declare-fun b!458928 () Bool)

(declare-fun res!274238 () Bool)

(assert (=> b!458928 (=> (not res!274238) (not e!267910))))

(declare-datatypes ((array!28480 0))(
  ( (array!28481 (arr!13680 (Array (_ BitVec 32) (_ BitVec 64))) (size!14032 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28480)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28480 (_ BitVec 32)) Bool)

(assert (=> b!458928 (= res!274238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458930 () Bool)

(declare-datatypes ((Unit!13317 0))(
  ( (Unit!13318) )
))
(declare-fun e!267912 () Unit!13317)

(declare-fun Unit!13319 () Unit!13317)

(assert (=> b!458930 (= e!267912 Unit!13319)))

(declare-fun mapIsEmpty!20164 () Bool)

(declare-fun mapRes!20164 () Bool)

(assert (=> mapIsEmpty!20164 mapRes!20164))

(declare-fun b!458931 () Bool)

(declare-fun e!267905 () Bool)

(declare-fun e!267904 () Bool)

(assert (=> b!458931 (= e!267905 (not e!267904))))

(declare-fun res!274239 () Bool)

(assert (=> b!458931 (=> res!274239 e!267904)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!458931 (= res!274239 (not (validKeyInArray!0 (select (arr!13680 _keys!709) from!863))))))

(declare-datatypes ((V!17563 0))(
  ( (V!17564 (val!6216 Int)) )
))
(declare-datatypes ((tuple2!8112 0))(
  ( (tuple2!8113 (_1!4067 (_ BitVec 64)) (_2!4067 V!17563)) )
))
(declare-datatypes ((List!8182 0))(
  ( (Nil!8179) (Cons!8178 (h!9034 tuple2!8112) (t!14058 List!8182)) )
))
(declare-datatypes ((ListLongMap!7027 0))(
  ( (ListLongMap!7028 (toList!3529 List!8182)) )
))
(declare-fun lt!207653 () ListLongMap!7027)

(declare-fun lt!207645 () ListLongMap!7027)

(assert (=> b!458931 (= lt!207653 lt!207645)))

(declare-fun lt!207644 () ListLongMap!7027)

(declare-fun v!412 () V!17563)

(declare-fun +!1609 (ListLongMap!7027 tuple2!8112) ListLongMap!7027)

(assert (=> b!458931 (= lt!207645 (+!1609 lt!207644 (tuple2!8113 k0!794 v!412)))))

(declare-fun minValue!515 () V!17563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5828 0))(
  ( (ValueCellFull!5828 (v!8495 V!17563)) (EmptyCell!5828) )
))
(declare-datatypes ((array!28482 0))(
  ( (array!28483 (arr!13681 (Array (_ BitVec 32) ValueCell!5828)) (size!14033 (_ BitVec 32))) )
))
(declare-fun lt!207652 () array!28482)

(declare-fun zeroValue!515 () V!17563)

(declare-fun lt!207649 () array!28480)

(declare-fun getCurrentListMapNoExtraKeys!1758 (array!28480 array!28482 (_ BitVec 32) (_ BitVec 32) V!17563 V!17563 (_ BitVec 32) Int) ListLongMap!7027)

(assert (=> b!458931 (= lt!207653 (getCurrentListMapNoExtraKeys!1758 lt!207649 lt!207652 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28482)

(assert (=> b!458931 (= lt!207644 (getCurrentListMapNoExtraKeys!1758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207646 () Unit!13317)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!766 (array!28480 array!28482 (_ BitVec 32) (_ BitVec 32) V!17563 V!17563 (_ BitVec 32) (_ BitVec 64) V!17563 (_ BitVec 32) Int) Unit!13317)

(assert (=> b!458931 (= lt!207646 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458932 () Bool)

(declare-fun e!267909 () Bool)

(assert (=> b!458932 (= e!267910 e!267909)))

(declare-fun res!274243 () Bool)

(assert (=> b!458932 (=> (not res!274243) (not e!267909))))

(assert (=> b!458932 (= res!274243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207649 mask!1025))))

(assert (=> b!458932 (= lt!207649 (array!28481 (store (arr!13680 _keys!709) i!563 k0!794) (size!14032 _keys!709)))))

(declare-fun mapNonEmpty!20164 () Bool)

(declare-fun tp!38850 () Bool)

(declare-fun e!267908 () Bool)

(assert (=> mapNonEmpty!20164 (= mapRes!20164 (and tp!38850 e!267908))))

(declare-fun mapRest!20164 () (Array (_ BitVec 32) ValueCell!5828))

(declare-fun mapKey!20164 () (_ BitVec 32))

(declare-fun mapValue!20164 () ValueCell!5828)

(assert (=> mapNonEmpty!20164 (= (arr!13681 _values!549) (store mapRest!20164 mapKey!20164 mapValue!20164))))

(declare-fun b!458933 () Bool)

(declare-fun res!274241 () Bool)

(assert (=> b!458933 (=> (not res!274241) (not e!267909))))

(declare-datatypes ((List!8183 0))(
  ( (Nil!8180) (Cons!8179 (h!9035 (_ BitVec 64)) (t!14059 List!8183)) )
))
(declare-fun arrayNoDuplicates!0 (array!28480 (_ BitVec 32) List!8183) Bool)

(assert (=> b!458933 (= res!274241 (arrayNoDuplicates!0 lt!207649 #b00000000000000000000000000000000 Nil!8180))))

(declare-fun b!458934 () Bool)

(declare-fun res!274251 () Bool)

(assert (=> b!458934 (=> (not res!274251) (not e!267910))))

(declare-fun arrayContainsKey!0 (array!28480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458934 (= res!274251 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458935 () Bool)

(assert (=> b!458935 (= e!267909 e!267905)))

(declare-fun res!274246 () Bool)

(assert (=> b!458935 (=> (not res!274246) (not e!267905))))

(assert (=> b!458935 (= res!274246 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207650 () ListLongMap!7027)

(assert (=> b!458935 (= lt!207650 (getCurrentListMapNoExtraKeys!1758 lt!207649 lt!207652 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458935 (= lt!207652 (array!28483 (store (arr!13681 _values!549) i!563 (ValueCellFull!5828 v!412)) (size!14033 _values!549)))))

(declare-fun lt!207648 () ListLongMap!7027)

(assert (=> b!458935 (= lt!207648 (getCurrentListMapNoExtraKeys!1758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458929 () Bool)

(declare-fun res!274244 () Bool)

(assert (=> b!458929 (=> (not res!274244) (not e!267910))))

(assert (=> b!458929 (= res!274244 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14032 _keys!709))))))

(declare-fun res!274249 () Bool)

(assert (=> start!41122 (=> (not res!274249) (not e!267910))))

(assert (=> start!41122 (= res!274249 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14032 _keys!709))))))

(assert (=> start!41122 e!267910))

(declare-fun tp_is_empty!12343 () Bool)

(assert (=> start!41122 tp_is_empty!12343))

(assert (=> start!41122 tp!38851))

(assert (=> start!41122 true))

(declare-fun e!267911 () Bool)

(declare-fun array_inv!9978 (array!28482) Bool)

(assert (=> start!41122 (and (array_inv!9978 _values!549) e!267911)))

(declare-fun array_inv!9979 (array!28480) Bool)

(assert (=> start!41122 (array_inv!9979 _keys!709)))

(declare-fun b!458936 () Bool)

(declare-fun res!274245 () Bool)

(assert (=> b!458936 (=> (not res!274245) (not e!267910))))

(assert (=> b!458936 (= res!274245 (and (= (size!14033 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14032 _keys!709) (size!14033 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458937 () Bool)

(declare-fun e!267906 () Bool)

(assert (=> b!458937 (= e!267906 tp_is_empty!12343)))

(declare-fun b!458938 () Bool)

(assert (=> b!458938 (= e!267908 tp_is_empty!12343)))

(declare-fun b!458939 () Bool)

(assert (=> b!458939 (= e!267904 (bvslt from!863 (size!14032 _keys!709)))))

(declare-fun lt!207647 () Unit!13317)

(assert (=> b!458939 (= lt!207647 e!267912)))

(declare-fun c!56429 () Bool)

(assert (=> b!458939 (= c!56429 (= (select (arr!13680 _keys!709) from!863) k0!794))))

(declare-fun get!6752 (ValueCell!5828 V!17563) V!17563)

(declare-fun dynLambda!890 (Int (_ BitVec 64)) V!17563)

(assert (=> b!458939 (= lt!207650 (+!1609 lt!207645 (tuple2!8113 (select (arr!13680 _keys!709) from!863) (get!6752 (select (arr!13681 _values!549) from!863) (dynLambda!890 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458940 () Bool)

(declare-fun res!274250 () Bool)

(assert (=> b!458940 (=> (not res!274250) (not e!267910))))

(assert (=> b!458940 (= res!274250 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8180))))

(declare-fun b!458941 () Bool)

(declare-fun res!274247 () Bool)

(assert (=> b!458941 (=> (not res!274247) (not e!267909))))

(assert (=> b!458941 (= res!274247 (bvsle from!863 i!563))))

(declare-fun b!458942 () Bool)

(declare-fun res!274248 () Bool)

(assert (=> b!458942 (=> (not res!274248) (not e!267910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458942 (= res!274248 (validMask!0 mask!1025))))

(declare-fun b!458943 () Bool)

(declare-fun Unit!13320 () Unit!13317)

(assert (=> b!458943 (= e!267912 Unit!13320)))

(declare-fun lt!207651 () Unit!13317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28480 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13317)

(assert (=> b!458943 (= lt!207651 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!458943 false))

(declare-fun b!458944 () Bool)

(assert (=> b!458944 (= e!267911 (and e!267906 mapRes!20164))))

(declare-fun condMapEmpty!20164 () Bool)

(declare-fun mapDefault!20164 () ValueCell!5828)

(assert (=> b!458944 (= condMapEmpty!20164 (= (arr!13681 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5828)) mapDefault!20164)))))

(declare-fun b!458945 () Bool)

(declare-fun res!274242 () Bool)

(assert (=> b!458945 (=> (not res!274242) (not e!267910))))

(assert (=> b!458945 (= res!274242 (or (= (select (arr!13680 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13680 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41122 res!274249) b!458942))

(assert (= (and b!458942 res!274248) b!458936))

(assert (= (and b!458936 res!274245) b!458928))

(assert (= (and b!458928 res!274238) b!458940))

(assert (= (and b!458940 res!274250) b!458929))

(assert (= (and b!458929 res!274244) b!458927))

(assert (= (and b!458927 res!274240) b!458945))

(assert (= (and b!458945 res!274242) b!458934))

(assert (= (and b!458934 res!274251) b!458932))

(assert (= (and b!458932 res!274243) b!458933))

(assert (= (and b!458933 res!274241) b!458941))

(assert (= (and b!458941 res!274247) b!458935))

(assert (= (and b!458935 res!274246) b!458931))

(assert (= (and b!458931 (not res!274239)) b!458939))

(assert (= (and b!458939 c!56429) b!458943))

(assert (= (and b!458939 (not c!56429)) b!458930))

(assert (= (and b!458944 condMapEmpty!20164) mapIsEmpty!20164))

(assert (= (and b!458944 (not condMapEmpty!20164)) mapNonEmpty!20164))

(get-info :version)

(assert (= (and mapNonEmpty!20164 ((_ is ValueCellFull!5828) mapValue!20164)) b!458938))

(assert (= (and b!458944 ((_ is ValueCellFull!5828) mapDefault!20164)) b!458937))

(assert (= start!41122 b!458944))

(declare-fun b_lambda!9853 () Bool)

(assert (=> (not b_lambda!9853) (not b!458939)))

(declare-fun t!14057 () Bool)

(declare-fun tb!3833 () Bool)

(assert (=> (and start!41122 (= defaultEntry!557 defaultEntry!557) t!14057) tb!3833))

(declare-fun result!7219 () Bool)

(assert (=> tb!3833 (= result!7219 tp_is_empty!12343)))

(assert (=> b!458939 t!14057))

(declare-fun b_and!19261 () Bool)

(assert (= b_and!19259 (and (=> t!14057 result!7219) b_and!19261)))

(declare-fun m!442505 () Bool)

(assert (=> b!458927 m!442505))

(declare-fun m!442507 () Bool)

(assert (=> b!458932 m!442507))

(declare-fun m!442509 () Bool)

(assert (=> b!458932 m!442509))

(declare-fun m!442511 () Bool)

(assert (=> b!458940 m!442511))

(declare-fun m!442513 () Bool)

(assert (=> b!458939 m!442513))

(declare-fun m!442515 () Bool)

(assert (=> b!458939 m!442515))

(declare-fun m!442517 () Bool)

(assert (=> b!458939 m!442517))

(declare-fun m!442519 () Bool)

(assert (=> b!458939 m!442519))

(assert (=> b!458939 m!442519))

(assert (=> b!458939 m!442515))

(declare-fun m!442521 () Bool)

(assert (=> b!458939 m!442521))

(declare-fun m!442523 () Bool)

(assert (=> b!458945 m!442523))

(assert (=> b!458931 m!442513))

(declare-fun m!442525 () Bool)

(assert (=> b!458931 m!442525))

(declare-fun m!442527 () Bool)

(assert (=> b!458931 m!442527))

(declare-fun m!442529 () Bool)

(assert (=> b!458931 m!442529))

(assert (=> b!458931 m!442513))

(declare-fun m!442531 () Bool)

(assert (=> b!458931 m!442531))

(declare-fun m!442533 () Bool)

(assert (=> b!458931 m!442533))

(declare-fun m!442535 () Bool)

(assert (=> start!41122 m!442535))

(declare-fun m!442537 () Bool)

(assert (=> start!41122 m!442537))

(declare-fun m!442539 () Bool)

(assert (=> b!458943 m!442539))

(declare-fun m!442541 () Bool)

(assert (=> mapNonEmpty!20164 m!442541))

(declare-fun m!442543 () Bool)

(assert (=> b!458934 m!442543))

(declare-fun m!442545 () Bool)

(assert (=> b!458928 m!442545))

(declare-fun m!442547 () Bool)

(assert (=> b!458935 m!442547))

(declare-fun m!442549 () Bool)

(assert (=> b!458935 m!442549))

(declare-fun m!442551 () Bool)

(assert (=> b!458935 m!442551))

(declare-fun m!442553 () Bool)

(assert (=> b!458942 m!442553))

(declare-fun m!442555 () Bool)

(assert (=> b!458933 m!442555))

(check-sat (not b!458932) (not start!41122) (not b_lambda!9853) (not b!458940) (not b!458931) (not mapNonEmpty!20164) (not b!458928) (not b!458942) tp_is_empty!12343 (not b!458933) (not b_next!11005) (not b!458943) (not b!458927) (not b!458935) b_and!19261 (not b!458939) (not b!458934))
(check-sat b_and!19261 (not b_next!11005))
