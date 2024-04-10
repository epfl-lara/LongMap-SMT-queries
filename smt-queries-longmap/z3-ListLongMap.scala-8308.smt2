; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101198 () Bool)

(assert start!101198)

(declare-fun b_free!26121 () Bool)

(declare-fun b_next!26121 () Bool)

(assert (=> start!101198 (= b_free!26121 (not b_next!26121))))

(declare-fun tp!91384 () Bool)

(declare-fun b_and!43359 () Bool)

(assert (=> start!101198 (= tp!91384 b_and!43359)))

(declare-fun b!1214936 () Bool)

(declare-fun res!806627 () Bool)

(declare-fun e!689907 () Bool)

(assert (=> b!1214936 (=> (not res!806627) (not e!689907))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78429 0))(
  ( (array!78430 (arr!37849 (Array (_ BitVec 32) (_ BitVec 64))) (size!38385 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78429)

(assert (=> b!1214936 (= res!806627 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38385 _keys!1208))))))

(declare-fun b!1214937 () Bool)

(declare-fun res!806628 () Bool)

(declare-fun e!689906 () Bool)

(assert (=> b!1214937 (=> (not res!806628) (not e!689906))))

(declare-fun lt!552480 () array!78429)

(declare-datatypes ((List!26683 0))(
  ( (Nil!26680) (Cons!26679 (h!27888 (_ BitVec 64)) (t!39784 List!26683)) )
))
(declare-fun arrayNoDuplicates!0 (array!78429 (_ BitVec 32) List!26683) Bool)

(assert (=> b!1214937 (= res!806628 (arrayNoDuplicates!0 lt!552480 #b00000000000000000000000000000000 Nil!26680))))

(declare-fun mapIsEmpty!48112 () Bool)

(declare-fun mapRes!48112 () Bool)

(assert (=> mapIsEmpty!48112 mapRes!48112))

(declare-fun b!1214938 () Bool)

(declare-fun e!689904 () Bool)

(declare-fun tp_is_empty!30825 () Bool)

(assert (=> b!1214938 (= e!689904 tp_is_empty!30825)))

(declare-fun b!1214939 () Bool)

(declare-fun res!806630 () Bool)

(assert (=> b!1214939 (=> (not res!806630) (not e!689907))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214939 (= res!806630 (validMask!0 mask!1564))))

(declare-fun b!1214940 () Bool)

(declare-fun res!806631 () Bool)

(assert (=> b!1214940 (=> (not res!806631) (not e!689907))))

(assert (=> b!1214940 (= res!806631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26680))))

(declare-fun b!1214941 () Bool)

(assert (=> b!1214941 (= e!689907 e!689906)))

(declare-fun res!806629 () Bool)

(assert (=> b!1214941 (=> (not res!806629) (not e!689906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78429 (_ BitVec 32)) Bool)

(assert (=> b!1214941 (= res!806629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552480 mask!1564))))

(assert (=> b!1214941 (= lt!552480 (array!78430 (store (arr!37849 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38385 _keys!1208)))))

(declare-fun mapNonEmpty!48112 () Bool)

(declare-fun tp!91385 () Bool)

(declare-fun e!689908 () Bool)

(assert (=> mapNonEmpty!48112 (= mapRes!48112 (and tp!91385 e!689908))))

(declare-datatypes ((V!46227 0))(
  ( (V!46228 (val!15469 Int)) )
))
(declare-datatypes ((ValueCell!14703 0))(
  ( (ValueCellFull!14703 (v!18122 V!46227)) (EmptyCell!14703) )
))
(declare-fun mapRest!48112 () (Array (_ BitVec 32) ValueCell!14703))

(declare-fun mapValue!48112 () ValueCell!14703)

(declare-datatypes ((array!78431 0))(
  ( (array!78432 (arr!37850 (Array (_ BitVec 32) ValueCell!14703)) (size!38386 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78431)

(declare-fun mapKey!48112 () (_ BitVec 32))

(assert (=> mapNonEmpty!48112 (= (arr!37850 _values!996) (store mapRest!48112 mapKey!48112 mapValue!48112))))

(declare-fun res!806636 () Bool)

(assert (=> start!101198 (=> (not res!806636) (not e!689907))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101198 (= res!806636 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38385 _keys!1208))))))

(assert (=> start!101198 e!689907))

(assert (=> start!101198 tp_is_empty!30825))

(declare-fun array_inv!28820 (array!78429) Bool)

(assert (=> start!101198 (array_inv!28820 _keys!1208)))

(assert (=> start!101198 true))

(assert (=> start!101198 tp!91384))

(declare-fun e!689905 () Bool)

(declare-fun array_inv!28821 (array!78431) Bool)

(assert (=> start!101198 (and (array_inv!28821 _values!996) e!689905)))

(declare-fun b!1214942 () Bool)

(declare-fun res!806632 () Bool)

(assert (=> b!1214942 (=> (not res!806632) (not e!689907))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214942 (= res!806632 (and (= (size!38386 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38385 _keys!1208) (size!38386 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214943 () Bool)

(declare-fun e!689902 () Bool)

(assert (=> b!1214943 (= e!689902 true)))

(declare-fun zeroValue!944 () V!46227)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19884 0))(
  ( (tuple2!19885 (_1!9953 (_ BitVec 64)) (_2!9953 V!46227)) )
))
(declare-datatypes ((List!26684 0))(
  ( (Nil!26681) (Cons!26680 (h!27889 tuple2!19884) (t!39785 List!26684)) )
))
(declare-datatypes ((ListLongMap!17853 0))(
  ( (ListLongMap!17854 (toList!8942 List!26684)) )
))
(declare-fun lt!552479 () ListLongMap!17853)

(declare-fun minValue!944 () V!46227)

(declare-fun getCurrentListMapNoExtraKeys!5369 (array!78429 array!78431 (_ BitVec 32) (_ BitVec 32) V!46227 V!46227 (_ BitVec 32) Int) ListLongMap!17853)

(declare-fun dynLambda!3258 (Int (_ BitVec 64)) V!46227)

(assert (=> b!1214943 (= lt!552479 (getCurrentListMapNoExtraKeys!5369 lt!552480 (array!78432 (store (arr!37850 _values!996) i!673 (ValueCellFull!14703 (dynLambda!3258 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38386 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552478 () ListLongMap!17853)

(assert (=> b!1214943 (= lt!552478 (getCurrentListMapNoExtraKeys!5369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214944 () Bool)

(declare-fun res!806634 () Bool)

(assert (=> b!1214944 (=> (not res!806634) (not e!689907))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214944 (= res!806634 (validKeyInArray!0 k0!934))))

(declare-fun b!1214945 () Bool)

(assert (=> b!1214945 (= e!689908 tp_is_empty!30825)))

(declare-fun b!1214946 () Bool)

(assert (=> b!1214946 (= e!689906 (not e!689902))))

(declare-fun res!806626 () Bool)

(assert (=> b!1214946 (=> res!806626 e!689902)))

(assert (=> b!1214946 (= res!806626 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214946 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40286 0))(
  ( (Unit!40287) )
))
(declare-fun lt!552477 () Unit!40286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78429 (_ BitVec 64) (_ BitVec 32)) Unit!40286)

(assert (=> b!1214946 (= lt!552477 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214947 () Bool)

(declare-fun res!806635 () Bool)

(assert (=> b!1214947 (=> (not res!806635) (not e!689907))))

(assert (=> b!1214947 (= res!806635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214948 () Bool)

(assert (=> b!1214948 (= e!689905 (and e!689904 mapRes!48112))))

(declare-fun condMapEmpty!48112 () Bool)

(declare-fun mapDefault!48112 () ValueCell!14703)

(assert (=> b!1214948 (= condMapEmpty!48112 (= (arr!37850 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14703)) mapDefault!48112)))))

(declare-fun b!1214949 () Bool)

(declare-fun res!806633 () Bool)

(assert (=> b!1214949 (=> (not res!806633) (not e!689907))))

(assert (=> b!1214949 (= res!806633 (= (select (arr!37849 _keys!1208) i!673) k0!934))))

(assert (= (and start!101198 res!806636) b!1214939))

(assert (= (and b!1214939 res!806630) b!1214942))

(assert (= (and b!1214942 res!806632) b!1214947))

(assert (= (and b!1214947 res!806635) b!1214940))

(assert (= (and b!1214940 res!806631) b!1214936))

(assert (= (and b!1214936 res!806627) b!1214944))

(assert (= (and b!1214944 res!806634) b!1214949))

(assert (= (and b!1214949 res!806633) b!1214941))

(assert (= (and b!1214941 res!806629) b!1214937))

(assert (= (and b!1214937 res!806628) b!1214946))

(assert (= (and b!1214946 (not res!806626)) b!1214943))

(assert (= (and b!1214948 condMapEmpty!48112) mapIsEmpty!48112))

(assert (= (and b!1214948 (not condMapEmpty!48112)) mapNonEmpty!48112))

(get-info :version)

(assert (= (and mapNonEmpty!48112 ((_ is ValueCellFull!14703) mapValue!48112)) b!1214945))

(assert (= (and b!1214948 ((_ is ValueCellFull!14703) mapDefault!48112)) b!1214938))

(assert (= start!101198 b!1214948))

(declare-fun b_lambda!21797 () Bool)

(assert (=> (not b_lambda!21797) (not b!1214943)))

(declare-fun t!39783 () Bool)

(declare-fun tb!10921 () Bool)

(assert (=> (and start!101198 (= defaultEntry!1004 defaultEntry!1004) t!39783) tb!10921))

(declare-fun result!22439 () Bool)

(assert (=> tb!10921 (= result!22439 tp_is_empty!30825)))

(assert (=> b!1214943 t!39783))

(declare-fun b_and!43361 () Bool)

(assert (= b_and!43359 (and (=> t!39783 result!22439) b_and!43361)))

(declare-fun m!1120021 () Bool)

(assert (=> b!1214941 m!1120021))

(declare-fun m!1120023 () Bool)

(assert (=> b!1214941 m!1120023))

(declare-fun m!1120025 () Bool)

(assert (=> b!1214943 m!1120025))

(declare-fun m!1120027 () Bool)

(assert (=> b!1214943 m!1120027))

(declare-fun m!1120029 () Bool)

(assert (=> b!1214943 m!1120029))

(declare-fun m!1120031 () Bool)

(assert (=> b!1214943 m!1120031))

(declare-fun m!1120033 () Bool)

(assert (=> b!1214944 m!1120033))

(declare-fun m!1120035 () Bool)

(assert (=> b!1214939 m!1120035))

(declare-fun m!1120037 () Bool)

(assert (=> start!101198 m!1120037))

(declare-fun m!1120039 () Bool)

(assert (=> start!101198 m!1120039))

(declare-fun m!1120041 () Bool)

(assert (=> b!1214949 m!1120041))

(declare-fun m!1120043 () Bool)

(assert (=> b!1214937 m!1120043))

(declare-fun m!1120045 () Bool)

(assert (=> b!1214940 m!1120045))

(declare-fun m!1120047 () Bool)

(assert (=> b!1214946 m!1120047))

(declare-fun m!1120049 () Bool)

(assert (=> b!1214946 m!1120049))

(declare-fun m!1120051 () Bool)

(assert (=> mapNonEmpty!48112 m!1120051))

(declare-fun m!1120053 () Bool)

(assert (=> b!1214947 m!1120053))

(check-sat (not b!1214941) (not b_lambda!21797) (not b!1214939) (not start!101198) (not b!1214944) tp_is_empty!30825 (not mapNonEmpty!48112) (not b_next!26121) (not b!1214943) (not b!1214940) (not b!1214947) b_and!43361 (not b!1214937) (not b!1214946))
(check-sat b_and!43361 (not b_next!26121))
