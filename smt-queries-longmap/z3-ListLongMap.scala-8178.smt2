; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99936 () Bool)

(assert start!99936)

(declare-fun b_free!25515 () Bool)

(declare-fun b_next!25515 () Bool)

(assert (=> start!99936 (= b_free!25515 (not b_next!25515))))

(declare-fun tp!89258 () Bool)

(declare-fun b_and!41897 () Bool)

(assert (=> start!99936 (= tp!89258 b_and!41897)))

(declare-fun b!1189776 () Bool)

(declare-fun res!791210 () Bool)

(declare-fun e!676420 () Bool)

(assert (=> b!1189776 (=> (not res!791210) (not e!676420))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189776 (= res!791210 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46895 () Bool)

(declare-fun mapRes!46895 () Bool)

(declare-fun tp!89259 () Bool)

(declare-fun e!676419 () Bool)

(assert (=> mapNonEmpty!46895 (= mapRes!46895 (and tp!89259 e!676419))))

(declare-datatypes ((V!45187 0))(
  ( (V!45188 (val!15079 Int)) )
))
(declare-datatypes ((ValueCell!14313 0))(
  ( (ValueCellFull!14313 (v!17717 V!45187)) (EmptyCell!14313) )
))
(declare-fun mapValue!46895 () ValueCell!14313)

(declare-fun mapRest!46895 () (Array (_ BitVec 32) ValueCell!14313))

(declare-datatypes ((array!76881 0))(
  ( (array!76882 (arr!37090 (Array (_ BitVec 32) ValueCell!14313)) (size!37626 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76881)

(declare-fun mapKey!46895 () (_ BitVec 32))

(assert (=> mapNonEmpty!46895 (= (arr!37090 _values!996) (store mapRest!46895 mapKey!46895 mapValue!46895))))

(declare-fun mapIsEmpty!46895 () Bool)

(assert (=> mapIsEmpty!46895 mapRes!46895))

(declare-fun b!1189777 () Bool)

(declare-fun res!791205 () Bool)

(declare-fun e!676425 () Bool)

(assert (=> b!1189777 (=> (not res!791205) (not e!676425))))

(declare-datatypes ((array!76883 0))(
  ( (array!76884 (arr!37091 (Array (_ BitVec 32) (_ BitVec 64))) (size!37627 (_ BitVec 32))) )
))
(declare-fun lt!541197 () array!76883)

(declare-datatypes ((List!26110 0))(
  ( (Nil!26107) (Cons!26106 (h!27315 (_ BitVec 64)) (t!38617 List!26110)) )
))
(declare-fun arrayNoDuplicates!0 (array!76883 (_ BitVec 32) List!26110) Bool)

(assert (=> b!1189777 (= res!791205 (arrayNoDuplicates!0 lt!541197 #b00000000000000000000000000000000 Nil!26107))))

(declare-fun b!1189778 () Bool)

(declare-fun e!676422 () Bool)

(assert (=> b!1189778 (= e!676425 (not e!676422))))

(declare-fun res!791215 () Bool)

(assert (=> b!1189778 (=> res!791215 e!676422)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189778 (= res!791215 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!76883)

(declare-fun arrayContainsKey!0 (array!76883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189778 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39464 0))(
  ( (Unit!39465) )
))
(declare-fun lt!541196 () Unit!39464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76883 (_ BitVec 64) (_ BitVec 32)) Unit!39464)

(assert (=> b!1189778 (= lt!541196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189779 () Bool)

(declare-fun res!791206 () Bool)

(assert (=> b!1189779 (=> (not res!791206) (not e!676420))))

(assert (=> b!1189779 (= res!791206 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26107))))

(declare-fun b!1189780 () Bool)

(declare-fun res!791208 () Bool)

(assert (=> b!1189780 (=> (not res!791208) (not e!676420))))

(assert (=> b!1189780 (= res!791208 (= (select (arr!37091 _keys!1208) i!673) k0!934))))

(declare-fun b!1189781 () Bool)

(declare-fun res!791214 () Bool)

(assert (=> b!1189781 (=> (not res!791214) (not e!676420))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189781 (= res!791214 (validMask!0 mask!1564))))

(declare-fun b!1189782 () Bool)

(declare-fun tp_is_empty!30045 () Bool)

(assert (=> b!1189782 (= e!676419 tp_is_empty!30045)))

(declare-fun b!1189783 () Bool)

(declare-fun res!791213 () Bool)

(assert (=> b!1189783 (=> (not res!791213) (not e!676420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76883 (_ BitVec 32)) Bool)

(assert (=> b!1189783 (= res!791213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189784 () Bool)

(declare-fun res!791211 () Bool)

(assert (=> b!1189784 (=> (not res!791211) (not e!676420))))

(assert (=> b!1189784 (= res!791211 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37627 _keys!1208))))))

(declare-fun b!1189785 () Bool)

(declare-fun e!676424 () Bool)

(assert (=> b!1189785 (= e!676422 e!676424)))

(declare-fun res!791207 () Bool)

(assert (=> b!1189785 (=> res!791207 e!676424)))

(assert (=> b!1189785 (= res!791207 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45187)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19364 0))(
  ( (tuple2!19365 (_1!9693 (_ BitVec 64)) (_2!9693 V!45187)) )
))
(declare-datatypes ((List!26111 0))(
  ( (Nil!26108) (Cons!26107 (h!27316 tuple2!19364) (t!38618 List!26111)) )
))
(declare-datatypes ((ListLongMap!17333 0))(
  ( (ListLongMap!17334 (toList!8682 List!26111)) )
))
(declare-fun lt!541198 () ListLongMap!17333)

(declare-fun lt!541195 () array!76881)

(declare-fun minValue!944 () V!45187)

(declare-fun getCurrentListMapNoExtraKeys!5123 (array!76883 array!76881 (_ BitVec 32) (_ BitVec 32) V!45187 V!45187 (_ BitVec 32) Int) ListLongMap!17333)

(assert (=> b!1189785 (= lt!541198 (getCurrentListMapNoExtraKeys!5123 lt!541197 lt!541195 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3066 (Int (_ BitVec 64)) V!45187)

(assert (=> b!1189785 (= lt!541195 (array!76882 (store (arr!37090 _values!996) i!673 (ValueCellFull!14313 (dynLambda!3066 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37626 _values!996)))))

(declare-fun lt!541199 () ListLongMap!17333)

(assert (=> b!1189785 (= lt!541199 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189786 () Bool)

(declare-fun e!676426 () Bool)

(declare-fun e!676423 () Bool)

(assert (=> b!1189786 (= e!676426 (and e!676423 mapRes!46895))))

(declare-fun condMapEmpty!46895 () Bool)

(declare-fun mapDefault!46895 () ValueCell!14313)

(assert (=> b!1189786 (= condMapEmpty!46895 (= (arr!37090 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14313)) mapDefault!46895)))))

(declare-fun b!1189787 () Bool)

(declare-fun res!791204 () Bool)

(assert (=> b!1189787 (=> (not res!791204) (not e!676420))))

(assert (=> b!1189787 (= res!791204 (and (= (size!37626 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37627 _keys!1208) (size!37626 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189788 () Bool)

(assert (=> b!1189788 (= e!676424 true)))

(declare-fun -!1711 (ListLongMap!17333 (_ BitVec 64)) ListLongMap!17333)

(assert (=> b!1189788 (= (getCurrentListMapNoExtraKeys!5123 lt!541197 lt!541195 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1711 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541200 () Unit!39464)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!920 (array!76883 array!76881 (_ BitVec 32) (_ BitVec 32) V!45187 V!45187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39464)

(assert (=> b!1189788 (= lt!541200 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!920 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189789 () Bool)

(assert (=> b!1189789 (= e!676420 e!676425)))

(declare-fun res!791212 () Bool)

(assert (=> b!1189789 (=> (not res!791212) (not e!676425))))

(assert (=> b!1189789 (= res!791212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541197 mask!1564))))

(assert (=> b!1189789 (= lt!541197 (array!76884 (store (arr!37091 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37627 _keys!1208)))))

(declare-fun res!791209 () Bool)

(assert (=> start!99936 (=> (not res!791209) (not e!676420))))

(assert (=> start!99936 (= res!791209 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37627 _keys!1208))))))

(assert (=> start!99936 e!676420))

(assert (=> start!99936 tp_is_empty!30045))

(declare-fun array_inv!28290 (array!76883) Bool)

(assert (=> start!99936 (array_inv!28290 _keys!1208)))

(assert (=> start!99936 true))

(assert (=> start!99936 tp!89258))

(declare-fun array_inv!28291 (array!76881) Bool)

(assert (=> start!99936 (and (array_inv!28291 _values!996) e!676426)))

(declare-fun b!1189790 () Bool)

(assert (=> b!1189790 (= e!676423 tp_is_empty!30045)))

(assert (= (and start!99936 res!791209) b!1189781))

(assert (= (and b!1189781 res!791214) b!1189787))

(assert (= (and b!1189787 res!791204) b!1189783))

(assert (= (and b!1189783 res!791213) b!1189779))

(assert (= (and b!1189779 res!791206) b!1189784))

(assert (= (and b!1189784 res!791211) b!1189776))

(assert (= (and b!1189776 res!791210) b!1189780))

(assert (= (and b!1189780 res!791208) b!1189789))

(assert (= (and b!1189789 res!791212) b!1189777))

(assert (= (and b!1189777 res!791205) b!1189778))

(assert (= (and b!1189778 (not res!791215)) b!1189785))

(assert (= (and b!1189785 (not res!791207)) b!1189788))

(assert (= (and b!1189786 condMapEmpty!46895) mapIsEmpty!46895))

(assert (= (and b!1189786 (not condMapEmpty!46895)) mapNonEmpty!46895))

(get-info :version)

(assert (= (and mapNonEmpty!46895 ((_ is ValueCellFull!14313) mapValue!46895)) b!1189782))

(assert (= (and b!1189786 ((_ is ValueCellFull!14313) mapDefault!46895)) b!1189790))

(assert (= start!99936 b!1189786))

(declare-fun b_lambda!20659 () Bool)

(assert (=> (not b_lambda!20659) (not b!1189785)))

(declare-fun t!38616 () Bool)

(declare-fun tb!10327 () Bool)

(assert (=> (and start!99936 (= defaultEntry!1004 defaultEntry!1004) t!38616) tb!10327))

(declare-fun result!21221 () Bool)

(assert (=> tb!10327 (= result!21221 tp_is_empty!30045)))

(assert (=> b!1189785 t!38616))

(declare-fun b_and!41899 () Bool)

(assert (= b_and!41897 (and (=> t!38616 result!21221) b_and!41899)))

(declare-fun m!1098417 () Bool)

(assert (=> b!1189781 m!1098417))

(declare-fun m!1098419 () Bool)

(assert (=> mapNonEmpty!46895 m!1098419))

(declare-fun m!1098421 () Bool)

(assert (=> start!99936 m!1098421))

(declare-fun m!1098423 () Bool)

(assert (=> start!99936 m!1098423))

(declare-fun m!1098425 () Bool)

(assert (=> b!1189785 m!1098425))

(declare-fun m!1098427 () Bool)

(assert (=> b!1189785 m!1098427))

(declare-fun m!1098429 () Bool)

(assert (=> b!1189785 m!1098429))

(declare-fun m!1098431 () Bool)

(assert (=> b!1189785 m!1098431))

(declare-fun m!1098433 () Bool)

(assert (=> b!1189789 m!1098433))

(declare-fun m!1098435 () Bool)

(assert (=> b!1189789 m!1098435))

(declare-fun m!1098437 () Bool)

(assert (=> b!1189780 m!1098437))

(declare-fun m!1098439 () Bool)

(assert (=> b!1189788 m!1098439))

(declare-fun m!1098441 () Bool)

(assert (=> b!1189788 m!1098441))

(assert (=> b!1189788 m!1098441))

(declare-fun m!1098443 () Bool)

(assert (=> b!1189788 m!1098443))

(declare-fun m!1098445 () Bool)

(assert (=> b!1189788 m!1098445))

(declare-fun m!1098447 () Bool)

(assert (=> b!1189776 m!1098447))

(declare-fun m!1098449 () Bool)

(assert (=> b!1189778 m!1098449))

(declare-fun m!1098451 () Bool)

(assert (=> b!1189778 m!1098451))

(declare-fun m!1098453 () Bool)

(assert (=> b!1189779 m!1098453))

(declare-fun m!1098455 () Bool)

(assert (=> b!1189777 m!1098455))

(declare-fun m!1098457 () Bool)

(assert (=> b!1189783 m!1098457))

(check-sat (not mapNonEmpty!46895) (not b_next!25515) (not b!1189781) (not b!1189783) (not b!1189789) (not b_lambda!20659) (not b!1189788) tp_is_empty!30045 (not b!1189776) (not b!1189785) (not b!1189777) (not b!1189779) (not b!1189778) b_and!41899 (not start!99936))
(check-sat b_and!41899 (not b_next!25515))
