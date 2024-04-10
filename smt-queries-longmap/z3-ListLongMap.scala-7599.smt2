; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95916 () Bool)

(assert start!95916)

(declare-fun b_free!22569 () Bool)

(declare-fun b_next!22569 () Bool)

(assert (=> start!95916 (= b_free!22569 (not b_next!22569))))

(declare-fun tp!79556 () Bool)

(declare-fun b_and!35813 () Bool)

(assert (=> start!95916 (= tp!79556 b_and!35813)))

(declare-fun b!1086249 () Bool)

(declare-fun e!620521 () Bool)

(declare-fun tp_is_empty!26571 () Bool)

(assert (=> b!1086249 (= e!620521 tp_is_empty!26571)))

(declare-fun b!1086250 () Bool)

(declare-fun e!620515 () Bool)

(declare-fun e!620522 () Bool)

(assert (=> b!1086250 (= e!620515 (not e!620522))))

(declare-fun res!724307 () Bool)

(assert (=> b!1086250 (=> res!724307 e!620522)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086250 (= res!724307 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40555 0))(
  ( (V!40556 (val!13342 Int)) )
))
(declare-fun minValue!831 () V!40555)

(declare-fun zeroValue!831 () V!40555)

(declare-datatypes ((array!70077 0))(
  ( (array!70078 (arr!33712 (Array (_ BitVec 32) (_ BitVec 64))) (size!34248 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70077)

(declare-datatypes ((ValueCell!12576 0))(
  ( (ValueCellFull!12576 (v!15963 V!40555)) (EmptyCell!12576) )
))
(declare-datatypes ((array!70079 0))(
  ( (array!70080 (arr!33713 (Array (_ BitVec 32) ValueCell!12576)) (size!34249 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70079)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16922 0))(
  ( (tuple2!16923 (_1!8472 (_ BitVec 64)) (_2!8472 V!40555)) )
))
(declare-datatypes ((List!23512 0))(
  ( (Nil!23509) (Cons!23508 (h!24717 tuple2!16922) (t!33139 List!23512)) )
))
(declare-datatypes ((ListLongMap!14891 0))(
  ( (ListLongMap!14892 (toList!7461 List!23512)) )
))
(declare-fun lt!482627 () ListLongMap!14891)

(declare-fun getCurrentListMap!4242 (array!70077 array!70079 (_ BitVec 32) (_ BitVec 32) V!40555 V!40555 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1086250 (= lt!482627 (getCurrentListMap!4242 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482632 () ListLongMap!14891)

(declare-fun lt!482631 () array!70077)

(declare-fun lt!482635 () array!70079)

(assert (=> b!1086250 (= lt!482632 (getCurrentListMap!4242 lt!482631 lt!482635 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482637 () ListLongMap!14891)

(declare-fun lt!482629 () ListLongMap!14891)

(assert (=> b!1086250 (and (= lt!482637 lt!482629) (= lt!482629 lt!482637))))

(declare-fun lt!482622 () ListLongMap!14891)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!787 (ListLongMap!14891 (_ BitVec 64)) ListLongMap!14891)

(assert (=> b!1086250 (= lt!482629 (-!787 lt!482622 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35740 0))(
  ( (Unit!35741) )
))
(declare-fun lt!482633 () Unit!35740)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!61 (array!70077 array!70079 (_ BitVec 32) (_ BitVec 32) V!40555 V!40555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35740)

(assert (=> b!1086250 (= lt!482633 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!61 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4002 (array!70077 array!70079 (_ BitVec 32) (_ BitVec 32) V!40555 V!40555 (_ BitVec 32) Int) ListLongMap!14891)

(assert (=> b!1086250 (= lt!482637 (getCurrentListMapNoExtraKeys!4002 lt!482631 lt!482635 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2139 (Int (_ BitVec 64)) V!40555)

(assert (=> b!1086250 (= lt!482635 (array!70080 (store (arr!33713 _values!874) i!650 (ValueCellFull!12576 (dynLambda!2139 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34249 _values!874)))))

(assert (=> b!1086250 (= lt!482622 (getCurrentListMapNoExtraKeys!4002 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086250 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482638 () Unit!35740)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70077 (_ BitVec 64) (_ BitVec 32)) Unit!35740)

(assert (=> b!1086250 (= lt!482638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086251 () Bool)

(declare-fun e!620516 () Bool)

(assert (=> b!1086251 (= e!620516 e!620515)))

(declare-fun res!724309 () Bool)

(assert (=> b!1086251 (=> (not res!724309) (not e!620515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70077 (_ BitVec 32)) Bool)

(assert (=> b!1086251 (= res!724309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482631 mask!1414))))

(assert (=> b!1086251 (= lt!482631 (array!70078 (store (arr!33712 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34248 _keys!1070)))))

(declare-fun b!1086252 () Bool)

(declare-fun res!724312 () Bool)

(assert (=> b!1086252 (=> (not res!724312) (not e!620516))))

(assert (=> b!1086252 (= res!724312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086253 () Bool)

(declare-fun res!724304 () Bool)

(assert (=> b!1086253 (=> (not res!724304) (not e!620516))))

(assert (=> b!1086253 (= res!724304 (and (= (size!34249 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34248 _keys!1070) (size!34249 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086254 () Bool)

(declare-fun res!724311 () Bool)

(assert (=> b!1086254 (=> (not res!724311) (not e!620516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086254 (= res!724311 (validKeyInArray!0 k0!904))))

(declare-fun b!1086255 () Bool)

(declare-fun e!620517 () Bool)

(declare-fun e!620519 () Bool)

(declare-fun mapRes!41611 () Bool)

(assert (=> b!1086255 (= e!620517 (and e!620519 mapRes!41611))))

(declare-fun condMapEmpty!41611 () Bool)

(declare-fun mapDefault!41611 () ValueCell!12576)

(assert (=> b!1086255 (= condMapEmpty!41611 (= (arr!33713 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12576)) mapDefault!41611)))))

(declare-fun b!1086256 () Bool)

(declare-fun res!724314 () Bool)

(assert (=> b!1086256 (=> (not res!724314) (not e!620516))))

(assert (=> b!1086256 (= res!724314 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34248 _keys!1070))))))

(declare-fun res!724308 () Bool)

(assert (=> start!95916 (=> (not res!724308) (not e!620516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95916 (= res!724308 (validMask!0 mask!1414))))

(assert (=> start!95916 e!620516))

(assert (=> start!95916 tp!79556))

(assert (=> start!95916 true))

(assert (=> start!95916 tp_is_empty!26571))

(declare-fun array_inv!26012 (array!70077) Bool)

(assert (=> start!95916 (array_inv!26012 _keys!1070)))

(declare-fun array_inv!26013 (array!70079) Bool)

(assert (=> start!95916 (and (array_inv!26013 _values!874) e!620517)))

(declare-fun mapNonEmpty!41611 () Bool)

(declare-fun tp!79555 () Bool)

(assert (=> mapNonEmpty!41611 (= mapRes!41611 (and tp!79555 e!620521))))

(declare-fun mapValue!41611 () ValueCell!12576)

(declare-fun mapKey!41611 () (_ BitVec 32))

(declare-fun mapRest!41611 () (Array (_ BitVec 32) ValueCell!12576))

(assert (=> mapNonEmpty!41611 (= (arr!33713 _values!874) (store mapRest!41611 mapKey!41611 mapValue!41611))))

(declare-fun b!1086257 () Bool)

(declare-fun e!620520 () Bool)

(assert (=> b!1086257 (= e!620520 true)))

(declare-fun lt!482636 () tuple2!16922)

(declare-fun lt!482630 () ListLongMap!14891)

(declare-fun lt!482628 () ListLongMap!14891)

(declare-fun +!3268 (ListLongMap!14891 tuple2!16922) ListLongMap!14891)

(assert (=> b!1086257 (= (-!787 lt!482628 k0!904) (+!3268 lt!482630 lt!482636))))

(declare-fun lt!482626 () ListLongMap!14891)

(declare-fun lt!482624 () Unit!35740)

(declare-fun addRemoveCommutativeForDiffKeys!24 (ListLongMap!14891 (_ BitVec 64) V!40555 (_ BitVec 64)) Unit!35740)

(assert (=> b!1086257 (= lt!482624 (addRemoveCommutativeForDiffKeys!24 lt!482626 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapIsEmpty!41611 () Bool)

(assert (=> mapIsEmpty!41611 mapRes!41611))

(declare-fun b!1086258 () Bool)

(declare-fun res!724310 () Bool)

(assert (=> b!1086258 (=> (not res!724310) (not e!620515))))

(declare-datatypes ((List!23513 0))(
  ( (Nil!23510) (Cons!23509 (h!24718 (_ BitVec 64)) (t!33140 List!23513)) )
))
(declare-fun arrayNoDuplicates!0 (array!70077 (_ BitVec 32) List!23513) Bool)

(assert (=> b!1086258 (= res!724310 (arrayNoDuplicates!0 lt!482631 #b00000000000000000000000000000000 Nil!23510))))

(declare-fun b!1086259 () Bool)

(declare-fun res!724306 () Bool)

(assert (=> b!1086259 (=> (not res!724306) (not e!620516))))

(assert (=> b!1086259 (= res!724306 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23510))))

(declare-fun b!1086260 () Bool)

(declare-fun res!724313 () Bool)

(assert (=> b!1086260 (=> (not res!724313) (not e!620516))))

(assert (=> b!1086260 (= res!724313 (= (select (arr!33712 _keys!1070) i!650) k0!904))))

(declare-fun b!1086261 () Bool)

(assert (=> b!1086261 (= e!620519 tp_is_empty!26571)))

(declare-fun b!1086262 () Bool)

(assert (=> b!1086262 (= e!620522 e!620520)))

(declare-fun res!724305 () Bool)

(assert (=> b!1086262 (=> res!724305 e!620520)))

(assert (=> b!1086262 (= res!724305 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482623 () ListLongMap!14891)

(assert (=> b!1086262 (= lt!482630 lt!482623)))

(assert (=> b!1086262 (= lt!482630 (-!787 lt!482626 k0!904))))

(declare-fun lt!482625 () Unit!35740)

(assert (=> b!1086262 (= lt!482625 (addRemoveCommutativeForDiffKeys!24 lt!482622 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086262 (= lt!482632 (+!3268 lt!482623 lt!482636))))

(declare-fun lt!482634 () tuple2!16922)

(assert (=> b!1086262 (= lt!482623 (+!3268 lt!482629 lt!482634))))

(assert (=> b!1086262 (= lt!482627 lt!482628)))

(assert (=> b!1086262 (= lt!482628 (+!3268 lt!482626 lt!482636))))

(assert (=> b!1086262 (= lt!482626 (+!3268 lt!482622 lt!482634))))

(assert (=> b!1086262 (= lt!482632 (+!3268 (+!3268 lt!482637 lt!482634) lt!482636))))

(assert (=> b!1086262 (= lt!482636 (tuple2!16923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086262 (= lt!482634 (tuple2!16923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!95916 res!724308) b!1086253))

(assert (= (and b!1086253 res!724304) b!1086252))

(assert (= (and b!1086252 res!724312) b!1086259))

(assert (= (and b!1086259 res!724306) b!1086256))

(assert (= (and b!1086256 res!724314) b!1086254))

(assert (= (and b!1086254 res!724311) b!1086260))

(assert (= (and b!1086260 res!724313) b!1086251))

(assert (= (and b!1086251 res!724309) b!1086258))

(assert (= (and b!1086258 res!724310) b!1086250))

(assert (= (and b!1086250 (not res!724307)) b!1086262))

(assert (= (and b!1086262 (not res!724305)) b!1086257))

(assert (= (and b!1086255 condMapEmpty!41611) mapIsEmpty!41611))

(assert (= (and b!1086255 (not condMapEmpty!41611)) mapNonEmpty!41611))

(get-info :version)

(assert (= (and mapNonEmpty!41611 ((_ is ValueCellFull!12576) mapValue!41611)) b!1086249))

(assert (= (and b!1086255 ((_ is ValueCellFull!12576) mapDefault!41611)) b!1086261))

(assert (= start!95916 b!1086255))

(declare-fun b_lambda!17239 () Bool)

(assert (=> (not b_lambda!17239) (not b!1086250)))

(declare-fun t!33138 () Bool)

(declare-fun tb!7447 () Bool)

(assert (=> (and start!95916 (= defaultEntry!882 defaultEntry!882) t!33138) tb!7447))

(declare-fun result!15413 () Bool)

(assert (=> tb!7447 (= result!15413 tp_is_empty!26571)))

(assert (=> b!1086250 t!33138))

(declare-fun b_and!35815 () Bool)

(assert (= b_and!35813 (and (=> t!33138 result!15413) b_and!35815)))

(declare-fun m!1004663 () Bool)

(assert (=> b!1086250 m!1004663))

(declare-fun m!1004665 () Bool)

(assert (=> b!1086250 m!1004665))

(declare-fun m!1004667 () Bool)

(assert (=> b!1086250 m!1004667))

(declare-fun m!1004669 () Bool)

(assert (=> b!1086250 m!1004669))

(declare-fun m!1004671 () Bool)

(assert (=> b!1086250 m!1004671))

(declare-fun m!1004673 () Bool)

(assert (=> b!1086250 m!1004673))

(declare-fun m!1004675 () Bool)

(assert (=> b!1086250 m!1004675))

(declare-fun m!1004677 () Bool)

(assert (=> b!1086250 m!1004677))

(declare-fun m!1004679 () Bool)

(assert (=> b!1086250 m!1004679))

(declare-fun m!1004681 () Bool)

(assert (=> b!1086250 m!1004681))

(declare-fun m!1004683 () Bool)

(assert (=> b!1086259 m!1004683))

(declare-fun m!1004685 () Bool)

(assert (=> b!1086260 m!1004685))

(declare-fun m!1004687 () Bool)

(assert (=> b!1086254 m!1004687))

(declare-fun m!1004689 () Bool)

(assert (=> b!1086257 m!1004689))

(declare-fun m!1004691 () Bool)

(assert (=> b!1086257 m!1004691))

(declare-fun m!1004693 () Bool)

(assert (=> b!1086257 m!1004693))

(declare-fun m!1004695 () Bool)

(assert (=> start!95916 m!1004695))

(declare-fun m!1004697 () Bool)

(assert (=> start!95916 m!1004697))

(declare-fun m!1004699 () Bool)

(assert (=> start!95916 m!1004699))

(declare-fun m!1004701 () Bool)

(assert (=> b!1086258 m!1004701))

(declare-fun m!1004703 () Bool)

(assert (=> mapNonEmpty!41611 m!1004703))

(declare-fun m!1004705 () Bool)

(assert (=> b!1086252 m!1004705))

(declare-fun m!1004707 () Bool)

(assert (=> b!1086251 m!1004707))

(declare-fun m!1004709 () Bool)

(assert (=> b!1086251 m!1004709))

(declare-fun m!1004711 () Bool)

(assert (=> b!1086262 m!1004711))

(declare-fun m!1004713 () Bool)

(assert (=> b!1086262 m!1004713))

(declare-fun m!1004715 () Bool)

(assert (=> b!1086262 m!1004715))

(declare-fun m!1004717 () Bool)

(assert (=> b!1086262 m!1004717))

(declare-fun m!1004719 () Bool)

(assert (=> b!1086262 m!1004719))

(assert (=> b!1086262 m!1004715))

(declare-fun m!1004721 () Bool)

(assert (=> b!1086262 m!1004721))

(declare-fun m!1004723 () Bool)

(assert (=> b!1086262 m!1004723))

(declare-fun m!1004725 () Bool)

(assert (=> b!1086262 m!1004725))

(check-sat (not b!1086257) (not b_lambda!17239) (not mapNonEmpty!41611) (not b!1086250) (not b_next!22569) b_and!35815 tp_is_empty!26571 (not b!1086252) (not b!1086259) (not b!1086254) (not b!1086262) (not b!1086251) (not b!1086258) (not start!95916))
(check-sat b_and!35815 (not b_next!22569))
