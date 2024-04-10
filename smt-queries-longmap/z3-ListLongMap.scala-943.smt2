; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20756 () Bool)

(assert start!20756)

(declare-fun b_free!5415 () Bool)

(declare-fun b_next!5415 () Bool)

(assert (=> start!20756 (= b_free!5415 (not b_next!5415))))

(declare-fun tp!19277 () Bool)

(declare-fun b_and!12161 () Bool)

(assert (=> start!20756 (= tp!19277 b_and!12161)))

(declare-fun b!207836 () Bool)

(declare-fun e!135628 () Bool)

(declare-fun e!135626 () Bool)

(declare-fun mapRes!8975 () Bool)

(assert (=> b!207836 (= e!135628 (and e!135626 mapRes!8975))))

(declare-fun condMapEmpty!8975 () Bool)

(declare-datatypes ((V!6675 0))(
  ( (V!6676 (val!2680 Int)) )
))
(declare-datatypes ((ValueCell!2292 0))(
  ( (ValueCellFull!2292 (v!4650 V!6675)) (EmptyCell!2292) )
))
(declare-datatypes ((array!9747 0))(
  ( (array!9748 (arr!4624 (Array (_ BitVec 32) ValueCell!2292)) (size!4949 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9747)

(declare-fun mapDefault!8975 () ValueCell!2292)

(assert (=> b!207836 (= condMapEmpty!8975 (= (arr!4624 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2292)) mapDefault!8975)))))

(declare-fun mapIsEmpty!8975 () Bool)

(assert (=> mapIsEmpty!8975 mapRes!8975))

(declare-fun b!207837 () Bool)

(declare-fun res!100990 () Bool)

(declare-fun e!135625 () Bool)

(assert (=> b!207837 (=> (not res!100990) (not e!135625))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207837 (= res!100990 (validKeyInArray!0 k0!843))))

(declare-fun b!207838 () Bool)

(declare-fun tp_is_empty!5271 () Bool)

(assert (=> b!207838 (= e!135626 tp_is_empty!5271)))

(declare-fun b!207839 () Bool)

(declare-fun res!100985 () Bool)

(assert (=> b!207839 (=> (not res!100985) (not e!135625))))

(declare-datatypes ((array!9749 0))(
  ( (array!9750 (arr!4625 (Array (_ BitVec 32) (_ BitVec 64))) (size!4950 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9749)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9749 (_ BitVec 32)) Bool)

(assert (=> b!207839 (= res!100985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207840 () Bool)

(declare-fun res!100984 () Bool)

(assert (=> b!207840 (=> (not res!100984) (not e!135625))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207840 (= res!100984 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4950 _keys!825))))))

(declare-fun mapNonEmpty!8975 () Bool)

(declare-fun tp!19276 () Bool)

(declare-fun e!135629 () Bool)

(assert (=> mapNonEmpty!8975 (= mapRes!8975 (and tp!19276 e!135629))))

(declare-fun mapKey!8975 () (_ BitVec 32))

(declare-fun mapRest!8975 () (Array (_ BitVec 32) ValueCell!2292))

(declare-fun mapValue!8975 () ValueCell!2292)

(assert (=> mapNonEmpty!8975 (= (arr!4624 _values!649) (store mapRest!8975 mapKey!8975 mapValue!8975))))

(declare-fun b!207841 () Bool)

(declare-fun res!100988 () Bool)

(assert (=> b!207841 (=> (not res!100988) (not e!135625))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207841 (= res!100988 (and (= (size!4949 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4950 _keys!825) (size!4949 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207842 () Bool)

(assert (=> b!207842 (= e!135625 (not true))))

(declare-datatypes ((tuple2!4066 0))(
  ( (tuple2!4067 (_1!2044 (_ BitVec 64)) (_2!2044 V!6675)) )
))
(declare-datatypes ((List!2958 0))(
  ( (Nil!2955) (Cons!2954 (h!3596 tuple2!4066) (t!7889 List!2958)) )
))
(declare-datatypes ((ListLongMap!2979 0))(
  ( (ListLongMap!2980 (toList!1505 List!2958)) )
))
(declare-fun lt!106559 () ListLongMap!2979)

(declare-fun zeroValue!615 () V!6675)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6675)

(declare-fun getCurrentListMap!1072 (array!9749 array!9747 (_ BitVec 32) (_ BitVec 32) V!6675 V!6675 (_ BitVec 32) Int) ListLongMap!2979)

(assert (=> b!207842 (= lt!106559 (getCurrentListMap!1072 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106557 () array!9747)

(declare-fun lt!106562 () ListLongMap!2979)

(assert (=> b!207842 (= lt!106562 (getCurrentListMap!1072 _keys!825 lt!106557 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106558 () ListLongMap!2979)

(declare-fun lt!106563 () ListLongMap!2979)

(assert (=> b!207842 (and (= lt!106558 lt!106563) (= lt!106563 lt!106558))))

(declare-fun v!520 () V!6675)

(declare-fun lt!106560 () ListLongMap!2979)

(declare-fun +!532 (ListLongMap!2979 tuple2!4066) ListLongMap!2979)

(assert (=> b!207842 (= lt!106563 (+!532 lt!106560 (tuple2!4067 k0!843 v!520)))))

(declare-datatypes ((Unit!6352 0))(
  ( (Unit!6353) )
))
(declare-fun lt!106561 () Unit!6352)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!185 (array!9749 array!9747 (_ BitVec 32) (_ BitVec 32) V!6675 V!6675 (_ BitVec 32) (_ BitVec 64) V!6675 (_ BitVec 32) Int) Unit!6352)

(assert (=> b!207842 (= lt!106561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!185 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!446 (array!9749 array!9747 (_ BitVec 32) (_ BitVec 32) V!6675 V!6675 (_ BitVec 32) Int) ListLongMap!2979)

(assert (=> b!207842 (= lt!106558 (getCurrentListMapNoExtraKeys!446 _keys!825 lt!106557 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207842 (= lt!106557 (array!9748 (store (arr!4624 _values!649) i!601 (ValueCellFull!2292 v!520)) (size!4949 _values!649)))))

(assert (=> b!207842 (= lt!106560 (getCurrentListMapNoExtraKeys!446 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207844 () Bool)

(declare-fun res!100986 () Bool)

(assert (=> b!207844 (=> (not res!100986) (not e!135625))))

(declare-datatypes ((List!2959 0))(
  ( (Nil!2956) (Cons!2955 (h!3597 (_ BitVec 64)) (t!7890 List!2959)) )
))
(declare-fun arrayNoDuplicates!0 (array!9749 (_ BitVec 32) List!2959) Bool)

(assert (=> b!207844 (= res!100986 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2956))))

(declare-fun b!207845 () Bool)

(assert (=> b!207845 (= e!135629 tp_is_empty!5271)))

(declare-fun b!207843 () Bool)

(declare-fun res!100989 () Bool)

(assert (=> b!207843 (=> (not res!100989) (not e!135625))))

(assert (=> b!207843 (= res!100989 (= (select (arr!4625 _keys!825) i!601) k0!843))))

(declare-fun res!100987 () Bool)

(assert (=> start!20756 (=> (not res!100987) (not e!135625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20756 (= res!100987 (validMask!0 mask!1149))))

(assert (=> start!20756 e!135625))

(declare-fun array_inv!3063 (array!9747) Bool)

(assert (=> start!20756 (and (array_inv!3063 _values!649) e!135628)))

(assert (=> start!20756 true))

(assert (=> start!20756 tp_is_empty!5271))

(declare-fun array_inv!3064 (array!9749) Bool)

(assert (=> start!20756 (array_inv!3064 _keys!825)))

(assert (=> start!20756 tp!19277))

(assert (= (and start!20756 res!100987) b!207841))

(assert (= (and b!207841 res!100988) b!207839))

(assert (= (and b!207839 res!100985) b!207844))

(assert (= (and b!207844 res!100986) b!207840))

(assert (= (and b!207840 res!100984) b!207837))

(assert (= (and b!207837 res!100990) b!207843))

(assert (= (and b!207843 res!100989) b!207842))

(assert (= (and b!207836 condMapEmpty!8975) mapIsEmpty!8975))

(assert (= (and b!207836 (not condMapEmpty!8975)) mapNonEmpty!8975))

(get-info :version)

(assert (= (and mapNonEmpty!8975 ((_ is ValueCellFull!2292) mapValue!8975)) b!207845))

(assert (= (and b!207836 ((_ is ValueCellFull!2292) mapDefault!8975)) b!207838))

(assert (= start!20756 b!207836))

(declare-fun m!235579 () Bool)

(assert (=> b!207844 m!235579))

(declare-fun m!235581 () Bool)

(assert (=> start!20756 m!235581))

(declare-fun m!235583 () Bool)

(assert (=> start!20756 m!235583))

(declare-fun m!235585 () Bool)

(assert (=> start!20756 m!235585))

(declare-fun m!235587 () Bool)

(assert (=> mapNonEmpty!8975 m!235587))

(declare-fun m!235589 () Bool)

(assert (=> b!207839 m!235589))

(declare-fun m!235591 () Bool)

(assert (=> b!207842 m!235591))

(declare-fun m!235593 () Bool)

(assert (=> b!207842 m!235593))

(declare-fun m!235595 () Bool)

(assert (=> b!207842 m!235595))

(declare-fun m!235597 () Bool)

(assert (=> b!207842 m!235597))

(declare-fun m!235599 () Bool)

(assert (=> b!207842 m!235599))

(declare-fun m!235601 () Bool)

(assert (=> b!207842 m!235601))

(declare-fun m!235603 () Bool)

(assert (=> b!207842 m!235603))

(declare-fun m!235605 () Bool)

(assert (=> b!207837 m!235605))

(declare-fun m!235607 () Bool)

(assert (=> b!207843 m!235607))

(check-sat b_and!12161 (not b!207844) (not start!20756) (not b!207842) tp_is_empty!5271 (not b!207839) (not b_next!5415) (not b!207837) (not mapNonEmpty!8975))
(check-sat b_and!12161 (not b_next!5415))
