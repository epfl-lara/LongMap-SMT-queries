; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40966 () Bool)

(assert start!40966)

(declare-fun b_free!10915 () Bool)

(declare-fun b_next!10915 () Bool)

(assert (=> start!40966 (= b_free!10915 (not b_next!10915))))

(declare-fun tp!38572 () Bool)

(declare-fun b_and!19031 () Bool)

(assert (=> start!40966 (= tp!38572 b_and!19031)))

(declare-fun b!455941 () Bool)

(declare-fun res!272060 () Bool)

(declare-fun e!266416 () Bool)

(assert (=> b!455941 (=> (not res!272060) (not e!266416))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28297 0))(
  ( (array!28298 (arr!13592 (Array (_ BitVec 32) (_ BitVec 64))) (size!13945 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28297)

(assert (=> b!455941 (= res!272060 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13945 _keys!709))))))

(declare-fun b!455942 () Bool)

(declare-fun e!266417 () Bool)

(declare-fun tp_is_empty!12253 () Bool)

(assert (=> b!455942 (= e!266417 tp_is_empty!12253)))

(declare-fun b!455943 () Bool)

(declare-fun res!272055 () Bool)

(declare-fun e!266419 () Bool)

(assert (=> b!455943 (=> (not res!272055) (not e!266419))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455943 (= res!272055 (bvsle from!863 i!563))))

(declare-fun b!455944 () Bool)

(declare-fun res!272062 () Bool)

(assert (=> b!455944 (=> (not res!272062) (not e!266416))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455944 (= res!272062 (validMask!0 mask!1025))))

(declare-fun b!455945 () Bool)

(declare-fun res!272058 () Bool)

(assert (=> b!455945 (=> (not res!272058) (not e!266419))))

(declare-fun lt!206256 () array!28297)

(declare-datatypes ((List!8208 0))(
  ( (Nil!8205) (Cons!8204 (h!9060 (_ BitVec 64)) (t!14027 List!8208)) )
))
(declare-fun arrayNoDuplicates!0 (array!28297 (_ BitVec 32) List!8208) Bool)

(assert (=> b!455945 (= res!272058 (arrayNoDuplicates!0 lt!206256 #b00000000000000000000000000000000 Nil!8205))))

(declare-fun b!455946 () Bool)

(declare-fun res!272061 () Bool)

(assert (=> b!455946 (=> (not res!272061) (not e!266416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28297 (_ BitVec 32)) Bool)

(assert (=> b!455946 (= res!272061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455948 () Bool)

(declare-fun e!266414 () Bool)

(assert (=> b!455948 (= e!266414 tp_is_empty!12253)))

(declare-fun b!455949 () Bool)

(assert (=> b!455949 (= e!266416 e!266419)))

(declare-fun res!272057 () Bool)

(assert (=> b!455949 (=> (not res!272057) (not e!266419))))

(assert (=> b!455949 (= res!272057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206256 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455949 (= lt!206256 (array!28298 (store (arr!13592 _keys!709) i!563 k0!794) (size!13945 _keys!709)))))

(declare-fun b!455950 () Bool)

(assert (=> b!455950 (= e!266419 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13945 _keys!709)) (bvsge (bvsub (size!13945 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13945 _keys!709) from!863))))))

(declare-datatypes ((V!17443 0))(
  ( (V!17444 (val!6171 Int)) )
))
(declare-fun minValue!515 () V!17443)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5783 0))(
  ( (ValueCellFull!5783 (v!8431 V!17443)) (EmptyCell!5783) )
))
(declare-datatypes ((array!28299 0))(
  ( (array!28300 (arr!13593 (Array (_ BitVec 32) ValueCell!5783)) (size!13946 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28299)

(declare-fun zeroValue!515 () V!17443)

(declare-datatypes ((tuple2!8146 0))(
  ( (tuple2!8147 (_1!4084 (_ BitVec 64)) (_2!4084 V!17443)) )
))
(declare-datatypes ((List!8209 0))(
  ( (Nil!8206) (Cons!8205 (h!9061 tuple2!8146) (t!14028 List!8209)) )
))
(declare-datatypes ((ListLongMap!7049 0))(
  ( (ListLongMap!7050 (toList!3540 List!8209)) )
))
(declare-fun lt!206257 () ListLongMap!7049)

(declare-fun v!412 () V!17443)

(declare-fun getCurrentListMapNoExtraKeys!1735 (array!28297 array!28299 (_ BitVec 32) (_ BitVec 32) V!17443 V!17443 (_ BitVec 32) Int) ListLongMap!7049)

(assert (=> b!455950 (= lt!206257 (getCurrentListMapNoExtraKeys!1735 lt!206256 (array!28300 (store (arr!13593 _values!549) i!563 (ValueCellFull!5783 v!412)) (size!13946 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206258 () ListLongMap!7049)

(assert (=> b!455950 (= lt!206258 (getCurrentListMapNoExtraKeys!1735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455951 () Bool)

(declare-fun res!272064 () Bool)

(assert (=> b!455951 (=> (not res!272064) (not e!266416))))

(assert (=> b!455951 (= res!272064 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8205))))

(declare-fun mapNonEmpty!20020 () Bool)

(declare-fun mapRes!20020 () Bool)

(declare-fun tp!38571 () Bool)

(assert (=> mapNonEmpty!20020 (= mapRes!20020 (and tp!38571 e!266417))))

(declare-fun mapRest!20020 () (Array (_ BitVec 32) ValueCell!5783))

(declare-fun mapValue!20020 () ValueCell!5783)

(declare-fun mapKey!20020 () (_ BitVec 32))

(assert (=> mapNonEmpty!20020 (= (arr!13593 _values!549) (store mapRest!20020 mapKey!20020 mapValue!20020))))

(declare-fun b!455952 () Bool)

(declare-fun res!272059 () Bool)

(assert (=> b!455952 (=> (not res!272059) (not e!266416))))

(declare-fun arrayContainsKey!0 (array!28297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455952 (= res!272059 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455947 () Bool)

(declare-fun res!272056 () Bool)

(assert (=> b!455947 (=> (not res!272056) (not e!266416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455947 (= res!272056 (validKeyInArray!0 k0!794))))

(declare-fun res!272063 () Bool)

(assert (=> start!40966 (=> (not res!272063) (not e!266416))))

(assert (=> start!40966 (= res!272063 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13945 _keys!709))))))

(assert (=> start!40966 e!266416))

(assert (=> start!40966 tp_is_empty!12253))

(assert (=> start!40966 tp!38572))

(assert (=> start!40966 true))

(declare-fun e!266418 () Bool)

(declare-fun array_inv!9906 (array!28299) Bool)

(assert (=> start!40966 (and (array_inv!9906 _values!549) e!266418)))

(declare-fun array_inv!9907 (array!28297) Bool)

(assert (=> start!40966 (array_inv!9907 _keys!709)))

(declare-fun mapIsEmpty!20020 () Bool)

(assert (=> mapIsEmpty!20020 mapRes!20020))

(declare-fun b!455953 () Bool)

(declare-fun res!272066 () Bool)

(assert (=> b!455953 (=> (not res!272066) (not e!266416))))

(assert (=> b!455953 (= res!272066 (or (= (select (arr!13592 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13592 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455954 () Bool)

(assert (=> b!455954 (= e!266418 (and e!266414 mapRes!20020))))

(declare-fun condMapEmpty!20020 () Bool)

(declare-fun mapDefault!20020 () ValueCell!5783)

(assert (=> b!455954 (= condMapEmpty!20020 (= (arr!13593 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5783)) mapDefault!20020)))))

(declare-fun b!455955 () Bool)

(declare-fun res!272065 () Bool)

(assert (=> b!455955 (=> (not res!272065) (not e!266416))))

(assert (=> b!455955 (= res!272065 (and (= (size!13946 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13945 _keys!709) (size!13946 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40966 res!272063) b!455944))

(assert (= (and b!455944 res!272062) b!455955))

(assert (= (and b!455955 res!272065) b!455946))

(assert (= (and b!455946 res!272061) b!455951))

(assert (= (and b!455951 res!272064) b!455941))

(assert (= (and b!455941 res!272060) b!455947))

(assert (= (and b!455947 res!272056) b!455953))

(assert (= (and b!455953 res!272066) b!455952))

(assert (= (and b!455952 res!272059) b!455949))

(assert (= (and b!455949 res!272057) b!455945))

(assert (= (and b!455945 res!272058) b!455943))

(assert (= (and b!455943 res!272055) b!455950))

(assert (= (and b!455954 condMapEmpty!20020) mapIsEmpty!20020))

(assert (= (and b!455954 (not condMapEmpty!20020)) mapNonEmpty!20020))

(get-info :version)

(assert (= (and mapNonEmpty!20020 ((_ is ValueCellFull!5783) mapValue!20020)) b!455942))

(assert (= (and b!455954 ((_ is ValueCellFull!5783) mapDefault!20020)) b!455948))

(assert (= start!40966 b!455954))

(declare-fun m!439007 () Bool)

(assert (=> b!455952 m!439007))

(declare-fun m!439009 () Bool)

(assert (=> b!455944 m!439009))

(declare-fun m!439011 () Bool)

(assert (=> b!455946 m!439011))

(declare-fun m!439013 () Bool)

(assert (=> b!455945 m!439013))

(declare-fun m!439015 () Bool)

(assert (=> mapNonEmpty!20020 m!439015))

(declare-fun m!439017 () Bool)

(assert (=> start!40966 m!439017))

(declare-fun m!439019 () Bool)

(assert (=> start!40966 m!439019))

(declare-fun m!439021 () Bool)

(assert (=> b!455949 m!439021))

(declare-fun m!439023 () Bool)

(assert (=> b!455949 m!439023))

(declare-fun m!439025 () Bool)

(assert (=> b!455951 m!439025))

(declare-fun m!439027 () Bool)

(assert (=> b!455953 m!439027))

(declare-fun m!439029 () Bool)

(assert (=> b!455950 m!439029))

(declare-fun m!439031 () Bool)

(assert (=> b!455950 m!439031))

(declare-fun m!439033 () Bool)

(assert (=> b!455950 m!439033))

(declare-fun m!439035 () Bool)

(assert (=> b!455947 m!439035))

(check-sat (not b!455944) (not b!455946) (not b!455949) b_and!19031 (not b_next!10915) (not mapNonEmpty!20020) (not b!455952) tp_is_empty!12253 (not b!455947) (not start!40966) (not b!455951) (not b!455950) (not b!455945))
(check-sat b_and!19031 (not b_next!10915))
