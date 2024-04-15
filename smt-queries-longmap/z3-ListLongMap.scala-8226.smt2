; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100258 () Bool)

(assert start!100258)

(declare-fun b!1195898 () Bool)

(declare-fun e!679497 () Bool)

(declare-fun tp_is_empty!30331 () Bool)

(assert (=> b!1195898 (= e!679497 tp_is_empty!30331)))

(declare-fun b!1195899 () Bool)

(declare-fun res!795843 () Bool)

(declare-fun e!679498 () Bool)

(assert (=> b!1195899 (=> (not res!795843) (not e!679498))))

(declare-datatypes ((array!77372 0))(
  ( (array!77373 (arr!37333 (Array (_ BitVec 32) (_ BitVec 64))) (size!37871 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77372)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195899 (= res!795843 (= (select (arr!37333 _keys!1208) i!673) k0!934))))

(declare-fun b!1195900 () Bool)

(declare-fun res!795848 () Bool)

(declare-fun e!679501 () Bool)

(assert (=> b!1195900 (=> (not res!795848) (not e!679501))))

(declare-fun lt!542825 () array!77372)

(declare-datatypes ((List!26367 0))(
  ( (Nil!26364) (Cons!26363 (h!27572 (_ BitVec 64)) (t!39029 List!26367)) )
))
(declare-fun arrayNoDuplicates!0 (array!77372 (_ BitVec 32) List!26367) Bool)

(assert (=> b!1195900 (= res!795848 (arrayNoDuplicates!0 lt!542825 #b00000000000000000000000000000000 Nil!26364))))

(declare-fun b!1195901 () Bool)

(declare-fun res!795844 () Bool)

(assert (=> b!1195901 (=> (not res!795844) (not e!679498))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45569 0))(
  ( (V!45570 (val!15222 Int)) )
))
(declare-datatypes ((ValueCell!14456 0))(
  ( (ValueCellFull!14456 (v!17859 V!45569)) (EmptyCell!14456) )
))
(declare-datatypes ((array!77374 0))(
  ( (array!77375 (arr!37334 (Array (_ BitVec 32) ValueCell!14456)) (size!37872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77374)

(assert (=> b!1195901 (= res!795844 (and (= (size!37872 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37871 _keys!1208) (size!37872 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195902 () Bool)

(declare-fun res!795850 () Bool)

(assert (=> b!1195902 (=> (not res!795850) (not e!679498))))

(assert (=> b!1195902 (= res!795850 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26364))))

(declare-fun b!1195903 () Bool)

(declare-fun res!795847 () Bool)

(assert (=> b!1195903 (=> (not res!795847) (not e!679498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195903 (= res!795847 (validMask!0 mask!1564))))

(declare-fun b!1195904 () Bool)

(declare-fun res!795841 () Bool)

(assert (=> b!1195904 (=> (not res!795841) (not e!679498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77372 (_ BitVec 32)) Bool)

(assert (=> b!1195904 (= res!795841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195905 () Bool)

(declare-fun e!679496 () Bool)

(assert (=> b!1195905 (= e!679496 tp_is_empty!30331)))

(declare-fun b!1195907 () Bool)

(declare-fun res!795849 () Bool)

(assert (=> b!1195907 (=> (not res!795849) (not e!679498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195907 (= res!795849 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47333 () Bool)

(declare-fun mapRes!47333 () Bool)

(declare-fun tp!89943 () Bool)

(assert (=> mapNonEmpty!47333 (= mapRes!47333 (and tp!89943 e!679496))))

(declare-fun mapKey!47333 () (_ BitVec 32))

(declare-fun mapRest!47333 () (Array (_ BitVec 32) ValueCell!14456))

(declare-fun mapValue!47333 () ValueCell!14456)

(assert (=> mapNonEmpty!47333 (= (arr!37334 _values!996) (store mapRest!47333 mapKey!47333 mapValue!47333))))

(declare-fun b!1195908 () Bool)

(assert (=> b!1195908 (= e!679498 e!679501)))

(declare-fun res!795845 () Bool)

(assert (=> b!1195908 (=> (not res!795845) (not e!679501))))

(assert (=> b!1195908 (= res!795845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542825 mask!1564))))

(assert (=> b!1195908 (= lt!542825 (array!77373 (store (arr!37333 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37871 _keys!1208)))))

(declare-fun mapIsEmpty!47333 () Bool)

(assert (=> mapIsEmpty!47333 mapRes!47333))

(declare-fun b!1195909 () Bool)

(declare-fun res!795846 () Bool)

(assert (=> b!1195909 (=> (not res!795846) (not e!679498))))

(assert (=> b!1195909 (= res!795846 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37871 _keys!1208))))))

(declare-fun b!1195910 () Bool)

(assert (=> b!1195910 (= e!679501 (not true))))

(declare-fun arrayContainsKey!0 (array!77372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195910 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39525 0))(
  ( (Unit!39526) )
))
(declare-fun lt!542826 () Unit!39525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77372 (_ BitVec 64) (_ BitVec 32)) Unit!39525)

(assert (=> b!1195910 (= lt!542826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!795842 () Bool)

(assert (=> start!100258 (=> (not res!795842) (not e!679498))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100258 (= res!795842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37871 _keys!1208))))))

(assert (=> start!100258 e!679498))

(declare-fun array_inv!28578 (array!77372) Bool)

(assert (=> start!100258 (array_inv!28578 _keys!1208)))

(assert (=> start!100258 true))

(declare-fun e!679500 () Bool)

(declare-fun array_inv!28579 (array!77374) Bool)

(assert (=> start!100258 (and (array_inv!28579 _values!996) e!679500)))

(declare-fun b!1195906 () Bool)

(assert (=> b!1195906 (= e!679500 (and e!679497 mapRes!47333))))

(declare-fun condMapEmpty!47333 () Bool)

(declare-fun mapDefault!47333 () ValueCell!14456)

(assert (=> b!1195906 (= condMapEmpty!47333 (= (arr!37334 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14456)) mapDefault!47333)))))

(assert (= (and start!100258 res!795842) b!1195903))

(assert (= (and b!1195903 res!795847) b!1195901))

(assert (= (and b!1195901 res!795844) b!1195904))

(assert (= (and b!1195904 res!795841) b!1195902))

(assert (= (and b!1195902 res!795850) b!1195909))

(assert (= (and b!1195909 res!795846) b!1195907))

(assert (= (and b!1195907 res!795849) b!1195899))

(assert (= (and b!1195899 res!795843) b!1195908))

(assert (= (and b!1195908 res!795845) b!1195900))

(assert (= (and b!1195900 res!795848) b!1195910))

(assert (= (and b!1195906 condMapEmpty!47333) mapIsEmpty!47333))

(assert (= (and b!1195906 (not condMapEmpty!47333)) mapNonEmpty!47333))

(get-info :version)

(assert (= (and mapNonEmpty!47333 ((_ is ValueCellFull!14456) mapValue!47333)) b!1195905))

(assert (= (and b!1195906 ((_ is ValueCellFull!14456) mapDefault!47333)) b!1195898))

(assert (= start!100258 b!1195906))

(declare-fun m!1102787 () Bool)

(assert (=> b!1195902 m!1102787))

(declare-fun m!1102789 () Bool)

(assert (=> start!100258 m!1102789))

(declare-fun m!1102791 () Bool)

(assert (=> start!100258 m!1102791))

(declare-fun m!1102793 () Bool)

(assert (=> b!1195908 m!1102793))

(declare-fun m!1102795 () Bool)

(assert (=> b!1195908 m!1102795))

(declare-fun m!1102797 () Bool)

(assert (=> b!1195903 m!1102797))

(declare-fun m!1102799 () Bool)

(assert (=> b!1195907 m!1102799))

(declare-fun m!1102801 () Bool)

(assert (=> b!1195899 m!1102801))

(declare-fun m!1102803 () Bool)

(assert (=> mapNonEmpty!47333 m!1102803))

(declare-fun m!1102805 () Bool)

(assert (=> b!1195910 m!1102805))

(declare-fun m!1102807 () Bool)

(assert (=> b!1195910 m!1102807))

(declare-fun m!1102809 () Bool)

(assert (=> b!1195904 m!1102809))

(declare-fun m!1102811 () Bool)

(assert (=> b!1195900 m!1102811))

(check-sat (not b!1195910) (not b!1195908) (not b!1195903) (not b!1195902) (not b!1195904) (not mapNonEmpty!47333) tp_is_empty!30331 (not b!1195907) (not start!100258) (not b!1195900))
(check-sat)
