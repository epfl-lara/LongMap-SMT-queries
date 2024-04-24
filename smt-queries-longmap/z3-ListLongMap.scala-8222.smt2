; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100476 () Bool)

(assert start!100476)

(declare-fun b!1196843 () Bool)

(declare-fun res!796059 () Bool)

(declare-fun e!680194 () Bool)

(assert (=> b!1196843 (=> (not res!796059) (not e!680194))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196843 (= res!796059 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47297 () Bool)

(declare-fun mapRes!47297 () Bool)

(declare-fun tp!89907 () Bool)

(declare-fun e!680191 () Bool)

(assert (=> mapNonEmpty!47297 (= mapRes!47297 (and tp!89907 e!680191))))

(declare-datatypes ((V!45537 0))(
  ( (V!45538 (val!15210 Int)) )
))
(declare-datatypes ((ValueCell!14444 0))(
  ( (ValueCellFull!14444 (v!17844 V!45537)) (EmptyCell!14444) )
))
(declare-fun mapValue!47297 () ValueCell!14444)

(declare-fun mapRest!47297 () (Array (_ BitVec 32) ValueCell!14444))

(declare-datatypes ((array!77435 0))(
  ( (array!77436 (arr!37358 (Array (_ BitVec 32) ValueCell!14444)) (size!37895 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77435)

(declare-fun mapKey!47297 () (_ BitVec 32))

(assert (=> mapNonEmpty!47297 (= (arr!37358 _values!996) (store mapRest!47297 mapKey!47297 mapValue!47297))))

(declare-fun b!1196844 () Bool)

(declare-fun res!796061 () Bool)

(assert (=> b!1196844 (=> (not res!796061) (not e!680194))))

(declare-datatypes ((array!77437 0))(
  ( (array!77438 (arr!37359 (Array (_ BitVec 32) (_ BitVec 64))) (size!37896 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77437)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196844 (= res!796061 (= (select (arr!37359 _keys!1208) i!673) k0!934))))

(declare-fun b!1196845 () Bool)

(declare-fun tp_is_empty!30307 () Bool)

(assert (=> b!1196845 (= e!680191 tp_is_empty!30307)))

(declare-fun b!1196846 () Bool)

(declare-fun res!796057 () Bool)

(assert (=> b!1196846 (=> (not res!796057) (not e!680194))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77437 (_ BitVec 32)) Bool)

(assert (=> b!1196846 (= res!796057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47297 () Bool)

(assert (=> mapIsEmpty!47297 mapRes!47297))

(declare-fun b!1196848 () Bool)

(declare-fun e!680190 () Bool)

(assert (=> b!1196848 (= e!680194 e!680190)))

(declare-fun res!796060 () Bool)

(assert (=> b!1196848 (=> (not res!796060) (not e!680190))))

(declare-fun lt!543429 () array!77437)

(assert (=> b!1196848 (= res!796060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543429 mask!1564))))

(assert (=> b!1196848 (= lt!543429 (array!77438 (store (arr!37359 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37896 _keys!1208)))))

(declare-fun b!1196849 () Bool)

(declare-fun res!796058 () Bool)

(assert (=> b!1196849 (=> (not res!796058) (not e!680190))))

(declare-datatypes ((List!26315 0))(
  ( (Nil!26312) (Cons!26311 (h!27529 (_ BitVec 64)) (t!38978 List!26315)) )
))
(declare-fun arrayNoDuplicates!0 (array!77437 (_ BitVec 32) List!26315) Bool)

(assert (=> b!1196849 (= res!796058 (arrayNoDuplicates!0 lt!543429 #b00000000000000000000000000000000 Nil!26312))))

(declare-fun b!1196850 () Bool)

(declare-fun e!680195 () Bool)

(assert (=> b!1196850 (= e!680195 tp_is_empty!30307)))

(declare-fun b!1196851 () Bool)

(declare-fun res!796062 () Bool)

(assert (=> b!1196851 (=> (not res!796062) (not e!680194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196851 (= res!796062 (validMask!0 mask!1564))))

(declare-fun b!1196847 () Bool)

(assert (=> b!1196847 (= e!680190 (not true))))

(declare-fun arrayContainsKey!0 (array!77437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196847 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39613 0))(
  ( (Unit!39614) )
))
(declare-fun lt!543430 () Unit!39613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77437 (_ BitVec 64) (_ BitVec 32)) Unit!39613)

(assert (=> b!1196847 (= lt!543430 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!796056 () Bool)

(assert (=> start!100476 (=> (not res!796056) (not e!680194))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100476 (= res!796056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37896 _keys!1208))))))

(assert (=> start!100476 e!680194))

(declare-fun array_inv!28548 (array!77437) Bool)

(assert (=> start!100476 (array_inv!28548 _keys!1208)))

(assert (=> start!100476 true))

(declare-fun e!680192 () Bool)

(declare-fun array_inv!28549 (array!77435) Bool)

(assert (=> start!100476 (and (array_inv!28549 _values!996) e!680192)))

(declare-fun b!1196852 () Bool)

(declare-fun res!796064 () Bool)

(assert (=> b!1196852 (=> (not res!796064) (not e!680194))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196852 (= res!796064 (and (= (size!37895 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37896 _keys!1208) (size!37895 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196853 () Bool)

(declare-fun res!796063 () Bool)

(assert (=> b!1196853 (=> (not res!796063) (not e!680194))))

(assert (=> b!1196853 (= res!796063 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37896 _keys!1208))))))

(declare-fun b!1196854 () Bool)

(assert (=> b!1196854 (= e!680192 (and e!680195 mapRes!47297))))

(declare-fun condMapEmpty!47297 () Bool)

(declare-fun mapDefault!47297 () ValueCell!14444)

(assert (=> b!1196854 (= condMapEmpty!47297 (= (arr!37358 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14444)) mapDefault!47297)))))

(declare-fun b!1196855 () Bool)

(declare-fun res!796055 () Bool)

(assert (=> b!1196855 (=> (not res!796055) (not e!680194))))

(assert (=> b!1196855 (= res!796055 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26312))))

(assert (= (and start!100476 res!796056) b!1196851))

(assert (= (and b!1196851 res!796062) b!1196852))

(assert (= (and b!1196852 res!796064) b!1196846))

(assert (= (and b!1196846 res!796057) b!1196855))

(assert (= (and b!1196855 res!796055) b!1196853))

(assert (= (and b!1196853 res!796063) b!1196843))

(assert (= (and b!1196843 res!796059) b!1196844))

(assert (= (and b!1196844 res!796061) b!1196848))

(assert (= (and b!1196848 res!796060) b!1196849))

(assert (= (and b!1196849 res!796058) b!1196847))

(assert (= (and b!1196854 condMapEmpty!47297) mapIsEmpty!47297))

(assert (= (and b!1196854 (not condMapEmpty!47297)) mapNonEmpty!47297))

(get-info :version)

(assert (= (and mapNonEmpty!47297 ((_ is ValueCellFull!14444) mapValue!47297)) b!1196845))

(assert (= (and b!1196854 ((_ is ValueCellFull!14444) mapDefault!47297)) b!1196850))

(assert (= start!100476 b!1196854))

(declare-fun m!1104657 () Bool)

(assert (=> b!1196851 m!1104657))

(declare-fun m!1104659 () Bool)

(assert (=> b!1196855 m!1104659))

(declare-fun m!1104661 () Bool)

(assert (=> start!100476 m!1104661))

(declare-fun m!1104663 () Bool)

(assert (=> start!100476 m!1104663))

(declare-fun m!1104665 () Bool)

(assert (=> b!1196844 m!1104665))

(declare-fun m!1104667 () Bool)

(assert (=> b!1196846 m!1104667))

(declare-fun m!1104669 () Bool)

(assert (=> b!1196849 m!1104669))

(declare-fun m!1104671 () Bool)

(assert (=> b!1196848 m!1104671))

(declare-fun m!1104673 () Bool)

(assert (=> b!1196848 m!1104673))

(declare-fun m!1104675 () Bool)

(assert (=> b!1196847 m!1104675))

(declare-fun m!1104677 () Bool)

(assert (=> b!1196847 m!1104677))

(declare-fun m!1104679 () Bool)

(assert (=> b!1196843 m!1104679))

(declare-fun m!1104681 () Bool)

(assert (=> mapNonEmpty!47297 m!1104681))

(check-sat (not b!1196847) (not mapNonEmpty!47297) (not start!100476) tp_is_empty!30307 (not b!1196851) (not b!1196846) (not b!1196855) (not b!1196849) (not b!1196843) (not b!1196848))
(check-sat)
