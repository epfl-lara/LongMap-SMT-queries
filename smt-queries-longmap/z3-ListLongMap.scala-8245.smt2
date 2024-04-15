; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100412 () Bool)

(assert start!100412)

(declare-fun b_free!25741 () Bool)

(declare-fun b_next!25741 () Bool)

(assert (=> start!100412 (= b_free!25741 (not b_next!25741))))

(declare-fun tp!90212 () Bool)

(declare-fun b_and!42347 () Bool)

(assert (=> start!100412 (= tp!90212 b_and!42347)))

(declare-fun b!1198580 () Bool)

(declare-fun res!797742 () Bool)

(declare-fun e!680820 () Bool)

(assert (=> b!1198580 (=> (not res!797742) (not e!680820))))

(declare-datatypes ((array!77594 0))(
  ( (array!77595 (arr!37442 (Array (_ BitVec 32) (_ BitVec 64))) (size!37980 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77594)

(declare-datatypes ((List!26428 0))(
  ( (Nil!26425) (Cons!26424 (h!27633 (_ BitVec 64)) (t!39140 List!26428)) )
))
(declare-fun arrayNoDuplicates!0 (array!77594 (_ BitVec 32) List!26428) Bool)

(assert (=> b!1198580 (= res!797742 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26425))))

(declare-fun b!1198581 () Bool)

(declare-fun e!680818 () Bool)

(assert (=> b!1198581 (= e!680820 e!680818)))

(declare-fun res!797740 () Bool)

(assert (=> b!1198581 (=> (not res!797740) (not e!680818))))

(declare-fun lt!543376 () array!77594)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77594 (_ BitVec 32)) Bool)

(assert (=> b!1198581 (= res!797740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543376 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198581 (= lt!543376 (array!77595 (store (arr!37442 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37980 _keys!1208)))))

(declare-fun b!1198582 () Bool)

(declare-fun res!797741 () Bool)

(assert (=> b!1198582 (=> (not res!797741) (not e!680820))))

(assert (=> b!1198582 (= res!797741 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37980 _keys!1208))))))

(declare-fun b!1198583 () Bool)

(declare-fun e!680817 () Bool)

(assert (=> b!1198583 (= e!680818 (not e!680817))))

(declare-fun res!797748 () Bool)

(assert (=> b!1198583 (=> res!797748 e!680817)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198583 (= res!797748 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198583 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39601 0))(
  ( (Unit!39602) )
))
(declare-fun lt!543379 () Unit!39601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77594 (_ BitVec 64) (_ BitVec 32)) Unit!39601)

(assert (=> b!1198583 (= lt!543379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198584 () Bool)

(declare-fun res!797743 () Bool)

(assert (=> b!1198584 (=> (not res!797743) (not e!680820))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45721 0))(
  ( (V!45722 (val!15279 Int)) )
))
(declare-datatypes ((ValueCell!14513 0))(
  ( (ValueCellFull!14513 (v!17916 V!45721)) (EmptyCell!14513) )
))
(declare-datatypes ((array!77596 0))(
  ( (array!77597 (arr!37443 (Array (_ BitVec 32) ValueCell!14513)) (size!37981 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77596)

(assert (=> b!1198584 (= res!797743 (and (= (size!37981 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37980 _keys!1208) (size!37981 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198585 () Bool)

(declare-fun res!797746 () Bool)

(assert (=> b!1198585 (=> (not res!797746) (not e!680818))))

(assert (=> b!1198585 (= res!797746 (arrayNoDuplicates!0 lt!543376 #b00000000000000000000000000000000 Nil!26425))))

(declare-fun mapIsEmpty!47510 () Bool)

(declare-fun mapRes!47510 () Bool)

(assert (=> mapIsEmpty!47510 mapRes!47510))

(declare-fun b!1198586 () Bool)

(assert (=> b!1198586 (= e!680817 true)))

(declare-fun zeroValue!944 () V!45721)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19640 0))(
  ( (tuple2!19641 (_1!9831 (_ BitVec 64)) (_2!9831 V!45721)) )
))
(declare-datatypes ((List!26429 0))(
  ( (Nil!26426) (Cons!26425 (h!27634 tuple2!19640) (t!39141 List!26429)) )
))
(declare-datatypes ((ListLongMap!17609 0))(
  ( (ListLongMap!17610 (toList!8820 List!26429)) )
))
(declare-fun lt!543377 () ListLongMap!17609)

(declare-fun minValue!944 () V!45721)

(declare-fun getCurrentListMapNoExtraKeys!5269 (array!77594 array!77596 (_ BitVec 32) (_ BitVec 32) V!45721 V!45721 (_ BitVec 32) Int) ListLongMap!17609)

(declare-fun dynLambda!3149 (Int (_ BitVec 64)) V!45721)

(assert (=> b!1198586 (= lt!543377 (getCurrentListMapNoExtraKeys!5269 lt!543376 (array!77597 (store (arr!37443 _values!996) i!673 (ValueCellFull!14513 (dynLambda!3149 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37981 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543378 () ListLongMap!17609)

(assert (=> b!1198586 (= lt!543378 (getCurrentListMapNoExtraKeys!5269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198587 () Bool)

(declare-fun e!680816 () Bool)

(declare-fun tp_is_empty!30445 () Bool)

(assert (=> b!1198587 (= e!680816 tp_is_empty!30445)))

(declare-fun res!797739 () Bool)

(assert (=> start!100412 (=> (not res!797739) (not e!680820))))

(assert (=> start!100412 (= res!797739 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37980 _keys!1208))))))

(assert (=> start!100412 e!680820))

(assert (=> start!100412 tp_is_empty!30445))

(declare-fun array_inv!28650 (array!77594) Bool)

(assert (=> start!100412 (array_inv!28650 _keys!1208)))

(assert (=> start!100412 true))

(assert (=> start!100412 tp!90212))

(declare-fun e!680819 () Bool)

(declare-fun array_inv!28651 (array!77596) Bool)

(assert (=> start!100412 (and (array_inv!28651 _values!996) e!680819)))

(declare-fun b!1198588 () Bool)

(declare-fun res!797738 () Bool)

(assert (=> b!1198588 (=> (not res!797738) (not e!680820))))

(assert (=> b!1198588 (= res!797738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198589 () Bool)

(declare-fun e!680815 () Bool)

(assert (=> b!1198589 (= e!680815 tp_is_empty!30445)))

(declare-fun b!1198590 () Bool)

(declare-fun res!797744 () Bool)

(assert (=> b!1198590 (=> (not res!797744) (not e!680820))))

(assert (=> b!1198590 (= res!797744 (= (select (arr!37442 _keys!1208) i!673) k0!934))))

(declare-fun b!1198591 () Bool)

(declare-fun res!797745 () Bool)

(assert (=> b!1198591 (=> (not res!797745) (not e!680820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198591 (= res!797745 (validMask!0 mask!1564))))

(declare-fun b!1198592 () Bool)

(declare-fun res!797747 () Bool)

(assert (=> b!1198592 (=> (not res!797747) (not e!680820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198592 (= res!797747 (validKeyInArray!0 k0!934))))

(declare-fun b!1198593 () Bool)

(assert (=> b!1198593 (= e!680819 (and e!680816 mapRes!47510))))

(declare-fun condMapEmpty!47510 () Bool)

(declare-fun mapDefault!47510 () ValueCell!14513)

(assert (=> b!1198593 (= condMapEmpty!47510 (= (arr!37443 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14513)) mapDefault!47510)))))

(declare-fun mapNonEmpty!47510 () Bool)

(declare-fun tp!90213 () Bool)

(assert (=> mapNonEmpty!47510 (= mapRes!47510 (and tp!90213 e!680815))))

(declare-fun mapKey!47510 () (_ BitVec 32))

(declare-fun mapValue!47510 () ValueCell!14513)

(declare-fun mapRest!47510 () (Array (_ BitVec 32) ValueCell!14513))

(assert (=> mapNonEmpty!47510 (= (arr!37443 _values!996) (store mapRest!47510 mapKey!47510 mapValue!47510))))

(assert (= (and start!100412 res!797739) b!1198591))

(assert (= (and b!1198591 res!797745) b!1198584))

(assert (= (and b!1198584 res!797743) b!1198588))

(assert (= (and b!1198588 res!797738) b!1198580))

(assert (= (and b!1198580 res!797742) b!1198582))

(assert (= (and b!1198582 res!797741) b!1198592))

(assert (= (and b!1198592 res!797747) b!1198590))

(assert (= (and b!1198590 res!797744) b!1198581))

(assert (= (and b!1198581 res!797740) b!1198585))

(assert (= (and b!1198585 res!797746) b!1198583))

(assert (= (and b!1198583 (not res!797748)) b!1198586))

(assert (= (and b!1198593 condMapEmpty!47510) mapIsEmpty!47510))

(assert (= (and b!1198593 (not condMapEmpty!47510)) mapNonEmpty!47510))

(get-info :version)

(assert (= (and mapNonEmpty!47510 ((_ is ValueCellFull!14513) mapValue!47510)) b!1198589))

(assert (= (and b!1198593 ((_ is ValueCellFull!14513) mapDefault!47510)) b!1198587))

(assert (= start!100412 b!1198593))

(declare-fun b_lambda!20919 () Bool)

(assert (=> (not b_lambda!20919) (not b!1198586)))

(declare-fun t!39139 () Bool)

(declare-fun tb!10533 () Bool)

(assert (=> (and start!100412 (= defaultEntry!1004 defaultEntry!1004) t!39139) tb!10533))

(declare-fun result!21651 () Bool)

(assert (=> tb!10533 (= result!21651 tp_is_empty!30445)))

(assert (=> b!1198586 t!39139))

(declare-fun b_and!42349 () Bool)

(assert (= b_and!42347 (and (=> t!39139 result!21651) b_and!42349)))

(declare-fun m!1104799 () Bool)

(assert (=> mapNonEmpty!47510 m!1104799))

(declare-fun m!1104801 () Bool)

(assert (=> b!1198580 m!1104801))

(declare-fun m!1104803 () Bool)

(assert (=> b!1198588 m!1104803))

(declare-fun m!1104805 () Bool)

(assert (=> b!1198592 m!1104805))

(declare-fun m!1104807 () Bool)

(assert (=> b!1198583 m!1104807))

(declare-fun m!1104809 () Bool)

(assert (=> b!1198583 m!1104809))

(declare-fun m!1104811 () Bool)

(assert (=> b!1198586 m!1104811))

(declare-fun m!1104813 () Bool)

(assert (=> b!1198586 m!1104813))

(declare-fun m!1104815 () Bool)

(assert (=> b!1198586 m!1104815))

(declare-fun m!1104817 () Bool)

(assert (=> b!1198586 m!1104817))

(declare-fun m!1104819 () Bool)

(assert (=> start!100412 m!1104819))

(declare-fun m!1104821 () Bool)

(assert (=> start!100412 m!1104821))

(declare-fun m!1104823 () Bool)

(assert (=> b!1198581 m!1104823))

(declare-fun m!1104825 () Bool)

(assert (=> b!1198581 m!1104825))

(declare-fun m!1104827 () Bool)

(assert (=> b!1198585 m!1104827))

(declare-fun m!1104829 () Bool)

(assert (=> b!1198590 m!1104829))

(declare-fun m!1104831 () Bool)

(assert (=> b!1198591 m!1104831))

(check-sat (not start!100412) (not b!1198591) (not b!1198585) (not b!1198581) b_and!42349 (not b!1198588) (not b_lambda!20919) (not b!1198592) (not b!1198583) tp_is_empty!30445 (not b!1198580) (not b!1198586) (not b_next!25741) (not mapNonEmpty!47510))
(check-sat b_and!42349 (not b_next!25741))
