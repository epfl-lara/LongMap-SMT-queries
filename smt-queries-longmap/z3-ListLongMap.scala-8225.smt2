; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100252 () Bool)

(assert start!100252)

(declare-fun b!1195781 () Bool)

(declare-fun e!679444 () Bool)

(assert (=> b!1195781 (= e!679444 (not true))))

(declare-datatypes ((array!77362 0))(
  ( (array!77363 (arr!37328 (Array (_ BitVec 32) (_ BitVec 64))) (size!37866 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77362)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195781 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39523 0))(
  ( (Unit!39524) )
))
(declare-fun lt!542807 () Unit!39523)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77362 (_ BitVec 64) (_ BitVec 32)) Unit!39523)

(assert (=> b!1195781 (= lt!542807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195782 () Bool)

(declare-fun e!679446 () Bool)

(declare-fun e!679447 () Bool)

(declare-fun mapRes!47324 () Bool)

(assert (=> b!1195782 (= e!679446 (and e!679447 mapRes!47324))))

(declare-fun condMapEmpty!47324 () Bool)

(declare-datatypes ((V!45561 0))(
  ( (V!45562 (val!15219 Int)) )
))
(declare-datatypes ((ValueCell!14453 0))(
  ( (ValueCellFull!14453 (v!17856 V!45561)) (EmptyCell!14453) )
))
(declare-datatypes ((array!77364 0))(
  ( (array!77365 (arr!37329 (Array (_ BitVec 32) ValueCell!14453)) (size!37867 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77364)

(declare-fun mapDefault!47324 () ValueCell!14453)

(assert (=> b!1195782 (= condMapEmpty!47324 (= (arr!37329 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14453)) mapDefault!47324)))))

(declare-fun b!1195783 () Bool)

(declare-fun res!795756 () Bool)

(declare-fun e!679443 () Bool)

(assert (=> b!1195783 (=> (not res!795756) (not e!679443))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77362 (_ BitVec 32)) Bool)

(assert (=> b!1195783 (= res!795756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!795755 () Bool)

(assert (=> start!100252 (=> (not res!795755) (not e!679443))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100252 (= res!795755 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37866 _keys!1208))))))

(assert (=> start!100252 e!679443))

(declare-fun array_inv!28576 (array!77362) Bool)

(assert (=> start!100252 (array_inv!28576 _keys!1208)))

(assert (=> start!100252 true))

(declare-fun array_inv!28577 (array!77364) Bool)

(assert (=> start!100252 (and (array_inv!28577 _values!996) e!679446)))

(declare-fun mapNonEmpty!47324 () Bool)

(declare-fun tp!89934 () Bool)

(declare-fun e!679445 () Bool)

(assert (=> mapNonEmpty!47324 (= mapRes!47324 (and tp!89934 e!679445))))

(declare-fun mapValue!47324 () ValueCell!14453)

(declare-fun mapKey!47324 () (_ BitVec 32))

(declare-fun mapRest!47324 () (Array (_ BitVec 32) ValueCell!14453))

(assert (=> mapNonEmpty!47324 (= (arr!37329 _values!996) (store mapRest!47324 mapKey!47324 mapValue!47324))))

(declare-fun b!1195784 () Bool)

(declare-fun res!795760 () Bool)

(assert (=> b!1195784 (=> (not res!795760) (not e!679443))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195784 (= res!795760 (and (= (size!37867 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37866 _keys!1208) (size!37867 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195785 () Bool)

(declare-fun res!795753 () Bool)

(assert (=> b!1195785 (=> (not res!795753) (not e!679443))))

(assert (=> b!1195785 (= res!795753 (= (select (arr!37328 _keys!1208) i!673) k0!934))))

(declare-fun b!1195786 () Bool)

(declare-fun res!795752 () Bool)

(assert (=> b!1195786 (=> (not res!795752) (not e!679443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195786 (= res!795752 (validKeyInArray!0 k0!934))))

(declare-fun b!1195787 () Bool)

(declare-fun res!795754 () Bool)

(assert (=> b!1195787 (=> (not res!795754) (not e!679443))))

(assert (=> b!1195787 (= res!795754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37866 _keys!1208))))))

(declare-fun b!1195788 () Bool)

(declare-fun res!795759 () Bool)

(assert (=> b!1195788 (=> (not res!795759) (not e!679444))))

(declare-fun lt!542808 () array!77362)

(declare-datatypes ((List!26365 0))(
  ( (Nil!26362) (Cons!26361 (h!27570 (_ BitVec 64)) (t!39027 List!26365)) )
))
(declare-fun arrayNoDuplicates!0 (array!77362 (_ BitVec 32) List!26365) Bool)

(assert (=> b!1195788 (= res!795759 (arrayNoDuplicates!0 lt!542808 #b00000000000000000000000000000000 Nil!26362))))

(declare-fun b!1195789 () Bool)

(declare-fun tp_is_empty!30325 () Bool)

(assert (=> b!1195789 (= e!679447 tp_is_empty!30325)))

(declare-fun b!1195790 () Bool)

(declare-fun res!795757 () Bool)

(assert (=> b!1195790 (=> (not res!795757) (not e!679443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195790 (= res!795757 (validMask!0 mask!1564))))

(declare-fun b!1195791 () Bool)

(assert (=> b!1195791 (= e!679445 tp_is_empty!30325)))

(declare-fun mapIsEmpty!47324 () Bool)

(assert (=> mapIsEmpty!47324 mapRes!47324))

(declare-fun b!1195792 () Bool)

(assert (=> b!1195792 (= e!679443 e!679444)))

(declare-fun res!795751 () Bool)

(assert (=> b!1195792 (=> (not res!795751) (not e!679444))))

(assert (=> b!1195792 (= res!795751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542808 mask!1564))))

(assert (=> b!1195792 (= lt!542808 (array!77363 (store (arr!37328 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37866 _keys!1208)))))

(declare-fun b!1195793 () Bool)

(declare-fun res!795758 () Bool)

(assert (=> b!1195793 (=> (not res!795758) (not e!679443))))

(assert (=> b!1195793 (= res!795758 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26362))))

(assert (= (and start!100252 res!795755) b!1195790))

(assert (= (and b!1195790 res!795757) b!1195784))

(assert (= (and b!1195784 res!795760) b!1195783))

(assert (= (and b!1195783 res!795756) b!1195793))

(assert (= (and b!1195793 res!795758) b!1195787))

(assert (= (and b!1195787 res!795754) b!1195786))

(assert (= (and b!1195786 res!795752) b!1195785))

(assert (= (and b!1195785 res!795753) b!1195792))

(assert (= (and b!1195792 res!795751) b!1195788))

(assert (= (and b!1195788 res!795759) b!1195781))

(assert (= (and b!1195782 condMapEmpty!47324) mapIsEmpty!47324))

(assert (= (and b!1195782 (not condMapEmpty!47324)) mapNonEmpty!47324))

(get-info :version)

(assert (= (and mapNonEmpty!47324 ((_ is ValueCellFull!14453) mapValue!47324)) b!1195791))

(assert (= (and b!1195782 ((_ is ValueCellFull!14453) mapDefault!47324)) b!1195789))

(assert (= start!100252 b!1195782))

(declare-fun m!1102709 () Bool)

(assert (=> b!1195781 m!1102709))

(declare-fun m!1102711 () Bool)

(assert (=> b!1195781 m!1102711))

(declare-fun m!1102713 () Bool)

(assert (=> b!1195783 m!1102713))

(declare-fun m!1102715 () Bool)

(assert (=> b!1195788 m!1102715))

(declare-fun m!1102717 () Bool)

(assert (=> b!1195792 m!1102717))

(declare-fun m!1102719 () Bool)

(assert (=> b!1195792 m!1102719))

(declare-fun m!1102721 () Bool)

(assert (=> mapNonEmpty!47324 m!1102721))

(declare-fun m!1102723 () Bool)

(assert (=> start!100252 m!1102723))

(declare-fun m!1102725 () Bool)

(assert (=> start!100252 m!1102725))

(declare-fun m!1102727 () Bool)

(assert (=> b!1195793 m!1102727))

(declare-fun m!1102729 () Bool)

(assert (=> b!1195790 m!1102729))

(declare-fun m!1102731 () Bool)

(assert (=> b!1195785 m!1102731))

(declare-fun m!1102733 () Bool)

(assert (=> b!1195786 m!1102733))

(check-sat (not b!1195790) tp_is_empty!30325 (not b!1195788) (not b!1195786) (not b!1195783) (not b!1195781) (not b!1195792) (not start!100252) (not b!1195793) (not mapNonEmpty!47324))
(check-sat)
