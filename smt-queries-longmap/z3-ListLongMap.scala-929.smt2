; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20674 () Bool)

(assert start!20674)

(declare-fun b_free!5329 () Bool)

(declare-fun b_next!5329 () Bool)

(assert (=> start!20674 (= b_free!5329 (not b_next!5329))))

(declare-fun tp!19018 () Bool)

(declare-fun b_and!12049 () Bool)

(assert (=> start!20674 (= tp!19018 b_and!12049)))

(declare-fun b!206399 () Bool)

(declare-fun res!99988 () Bool)

(declare-fun e!134880 () Bool)

(assert (=> b!206399 (=> (not res!99988) (not e!134880))))

(declare-datatypes ((array!9567 0))(
  ( (array!9568 (arr!4533 (Array (_ BitVec 32) (_ BitVec 64))) (size!4859 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9567)

(declare-datatypes ((List!2890 0))(
  ( (Nil!2887) (Cons!2886 (h!3528 (_ BitVec 64)) (t!7812 List!2890)) )
))
(declare-fun arrayNoDuplicates!0 (array!9567 (_ BitVec 32) List!2890) Bool)

(assert (=> b!206399 (= res!99988 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2887))))

(declare-fun res!99990 () Bool)

(assert (=> start!20674 (=> (not res!99990) (not e!134880))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20674 (= res!99990 (validMask!0 mask!1149))))

(assert (=> start!20674 e!134880))

(declare-datatypes ((V!6561 0))(
  ( (V!6562 (val!2637 Int)) )
))
(declare-datatypes ((ValueCell!2249 0))(
  ( (ValueCellFull!2249 (v!4601 V!6561)) (EmptyCell!2249) )
))
(declare-datatypes ((array!9569 0))(
  ( (array!9570 (arr!4534 (Array (_ BitVec 32) ValueCell!2249)) (size!4860 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9569)

(declare-fun e!134879 () Bool)

(declare-fun array_inv!2977 (array!9569) Bool)

(assert (=> start!20674 (and (array_inv!2977 _values!649) e!134879)))

(assert (=> start!20674 true))

(declare-fun tp_is_empty!5185 () Bool)

(assert (=> start!20674 tp_is_empty!5185))

(declare-fun array_inv!2978 (array!9567) Bool)

(assert (=> start!20674 (array_inv!2978 _keys!825)))

(assert (=> start!20674 tp!19018))

(declare-fun b!206400 () Bool)

(declare-fun e!134882 () Bool)

(assert (=> b!206400 (= e!134882 tp_is_empty!5185)))

(declare-fun b!206401 () Bool)

(declare-fun res!99987 () Bool)

(assert (=> b!206401 (=> (not res!99987) (not e!134880))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206401 (= res!99987 (and (= (size!4860 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4859 _keys!825) (size!4860 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206402 () Bool)

(declare-fun res!99991 () Bool)

(assert (=> b!206402 (=> (not res!99991) (not e!134880))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206402 (= res!99991 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4859 _keys!825))))))

(declare-fun b!206403 () Bool)

(declare-fun mapRes!8846 () Bool)

(assert (=> b!206403 (= e!134879 (and e!134882 mapRes!8846))))

(declare-fun condMapEmpty!8846 () Bool)

(declare-fun mapDefault!8846 () ValueCell!2249)

(assert (=> b!206403 (= condMapEmpty!8846 (= (arr!4534 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2249)) mapDefault!8846)))))

(declare-fun b!206404 () Bool)

(declare-fun e!134881 () Bool)

(assert (=> b!206404 (= e!134881 tp_is_empty!5185)))

(declare-fun b!206405 () Bool)

(declare-fun res!99989 () Bool)

(assert (=> b!206405 (=> (not res!99989) (not e!134880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9567 (_ BitVec 32)) Bool)

(assert (=> b!206405 (= res!99989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206406 () Bool)

(declare-fun res!99992 () Bool)

(assert (=> b!206406 (=> (not res!99992) (not e!134880))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206406 (= res!99992 (validKeyInArray!0 k0!843))))

(declare-fun b!206407 () Bool)

(assert (=> b!206407 (= e!134880 (not true))))

(declare-datatypes ((tuple2!3988 0))(
  ( (tuple2!3989 (_1!2005 (_ BitVec 64)) (_2!2005 V!6561)) )
))
(declare-datatypes ((List!2891 0))(
  ( (Nil!2888) (Cons!2887 (h!3529 tuple2!3988) (t!7813 List!2891)) )
))
(declare-datatypes ((ListLongMap!2891 0))(
  ( (ListLongMap!2892 (toList!1461 List!2891)) )
))
(declare-fun lt!105468 () ListLongMap!2891)

(declare-fun zeroValue!615 () V!6561)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6561)

(declare-fun getCurrentListMap!1002 (array!9567 array!9569 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) Int) ListLongMap!2891)

(assert (=> b!206407 (= lt!105468 (getCurrentListMap!1002 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105465 () array!9569)

(declare-fun lt!105469 () ListLongMap!2891)

(assert (=> b!206407 (= lt!105469 (getCurrentListMap!1002 _keys!825 lt!105465 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105470 () ListLongMap!2891)

(declare-fun lt!105464 () ListLongMap!2891)

(assert (=> b!206407 (and (= lt!105470 lt!105464) (= lt!105464 lt!105470))))

(declare-fun lt!105466 () ListLongMap!2891)

(declare-fun v!520 () V!6561)

(declare-fun +!510 (ListLongMap!2891 tuple2!3988) ListLongMap!2891)

(assert (=> b!206407 (= lt!105464 (+!510 lt!105466 (tuple2!3989 k0!843 v!520)))))

(declare-datatypes ((Unit!6260 0))(
  ( (Unit!6261) )
))
(declare-fun lt!105467 () Unit!6260)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 (array!9567 array!9569 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) (_ BitVec 64) V!6561 (_ BitVec 32) Int) Unit!6260)

(assert (=> b!206407 (= lt!105467 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!412 (array!9567 array!9569 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) Int) ListLongMap!2891)

(assert (=> b!206407 (= lt!105470 (getCurrentListMapNoExtraKeys!412 _keys!825 lt!105465 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206407 (= lt!105465 (array!9570 (store (arr!4534 _values!649) i!601 (ValueCellFull!2249 v!520)) (size!4860 _values!649)))))

(assert (=> b!206407 (= lt!105466 (getCurrentListMapNoExtraKeys!412 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8846 () Bool)

(declare-fun tp!19019 () Bool)

(assert (=> mapNonEmpty!8846 (= mapRes!8846 (and tp!19019 e!134881))))

(declare-fun mapKey!8846 () (_ BitVec 32))

(declare-fun mapValue!8846 () ValueCell!2249)

(declare-fun mapRest!8846 () (Array (_ BitVec 32) ValueCell!2249))

(assert (=> mapNonEmpty!8846 (= (arr!4534 _values!649) (store mapRest!8846 mapKey!8846 mapValue!8846))))

(declare-fun b!206408 () Bool)

(declare-fun res!99986 () Bool)

(assert (=> b!206408 (=> (not res!99986) (not e!134880))))

(assert (=> b!206408 (= res!99986 (= (select (arr!4533 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8846 () Bool)

(assert (=> mapIsEmpty!8846 mapRes!8846))

(assert (= (and start!20674 res!99990) b!206401))

(assert (= (and b!206401 res!99987) b!206405))

(assert (= (and b!206405 res!99989) b!206399))

(assert (= (and b!206399 res!99988) b!206402))

(assert (= (and b!206402 res!99991) b!206406))

(assert (= (and b!206406 res!99992) b!206408))

(assert (= (and b!206408 res!99986) b!206407))

(assert (= (and b!206403 condMapEmpty!8846) mapIsEmpty!8846))

(assert (= (and b!206403 (not condMapEmpty!8846)) mapNonEmpty!8846))

(get-info :version)

(assert (= (and mapNonEmpty!8846 ((_ is ValueCellFull!2249) mapValue!8846)) b!206404))

(assert (= (and b!206403 ((_ is ValueCellFull!2249) mapDefault!8846)) b!206400))

(assert (= start!20674 b!206403))

(declare-fun m!233673 () Bool)

(assert (=> start!20674 m!233673))

(declare-fun m!233675 () Bool)

(assert (=> start!20674 m!233675))

(declare-fun m!233677 () Bool)

(assert (=> start!20674 m!233677))

(declare-fun m!233679 () Bool)

(assert (=> b!206406 m!233679))

(declare-fun m!233681 () Bool)

(assert (=> mapNonEmpty!8846 m!233681))

(declare-fun m!233683 () Bool)

(assert (=> b!206408 m!233683))

(declare-fun m!233685 () Bool)

(assert (=> b!206405 m!233685))

(declare-fun m!233687 () Bool)

(assert (=> b!206407 m!233687))

(declare-fun m!233689 () Bool)

(assert (=> b!206407 m!233689))

(declare-fun m!233691 () Bool)

(assert (=> b!206407 m!233691))

(declare-fun m!233693 () Bool)

(assert (=> b!206407 m!233693))

(declare-fun m!233695 () Bool)

(assert (=> b!206407 m!233695))

(declare-fun m!233697 () Bool)

(assert (=> b!206407 m!233697))

(declare-fun m!233699 () Bool)

(assert (=> b!206407 m!233699))

(declare-fun m!233701 () Bool)

(assert (=> b!206399 m!233701))

(check-sat (not b!206407) (not b_next!5329) (not mapNonEmpty!8846) (not start!20674) tp_is_empty!5185 (not b!206405) b_and!12049 (not b!206399) (not b!206406))
(check-sat b_and!12049 (not b_next!5329))
