; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100340 () Bool)

(assert start!100340)

(declare-fun b!1197364 () Bool)

(declare-fun res!796848 () Bool)

(declare-fun e!680219 () Bool)

(assert (=> b!1197364 (=> (not res!796848) (not e!680219))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45649 0))(
  ( (V!45650 (val!15252 Int)) )
))
(declare-datatypes ((ValueCell!14486 0))(
  ( (ValueCellFull!14486 (v!17889 V!45649)) (EmptyCell!14486) )
))
(declare-datatypes ((array!77492 0))(
  ( (array!77493 (arr!37392 (Array (_ BitVec 32) ValueCell!14486)) (size!37930 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77492)

(declare-datatypes ((array!77494 0))(
  ( (array!77495 (arr!37393 (Array (_ BitVec 32) (_ BitVec 64))) (size!37931 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77494)

(assert (=> b!1197364 (= res!796848 (and (= (size!37930 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37931 _keys!1208) (size!37930 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!796842 () Bool)

(assert (=> start!100340 (=> (not res!796842) (not e!680219))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100340 (= res!796842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37931 _keys!1208))))))

(assert (=> start!100340 e!680219))

(declare-fun array_inv!28620 (array!77494) Bool)

(assert (=> start!100340 (array_inv!28620 _keys!1208)))

(assert (=> start!100340 true))

(declare-fun e!680215 () Bool)

(declare-fun array_inv!28621 (array!77492) Bool)

(assert (=> start!100340 (and (array_inv!28621 _values!996) e!680215)))

(declare-fun b!1197365 () Bool)

(declare-fun e!680217 () Bool)

(declare-fun mapRes!47426 () Bool)

(assert (=> b!1197365 (= e!680215 (and e!680217 mapRes!47426))))

(declare-fun condMapEmpty!47426 () Bool)

(declare-fun mapDefault!47426 () ValueCell!14486)

(assert (=> b!1197365 (= condMapEmpty!47426 (= (arr!37392 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14486)) mapDefault!47426)))))

(declare-fun mapIsEmpty!47426 () Bool)

(assert (=> mapIsEmpty!47426 mapRes!47426))

(declare-fun b!1197366 () Bool)

(declare-fun tp_is_empty!30391 () Bool)

(assert (=> b!1197366 (= e!680217 tp_is_empty!30391)))

(declare-fun b!1197367 () Bool)

(declare-fun res!796839 () Bool)

(assert (=> b!1197367 (=> (not res!796839) (not e!680219))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1197367 (= res!796839 (= (select (arr!37393 _keys!1208) i!673) k0!934))))

(declare-fun b!1197368 () Bool)

(declare-fun e!680216 () Bool)

(assert (=> b!1197368 (= e!680216 (not true))))

(declare-fun arrayContainsKey!0 (array!77494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197368 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39569 0))(
  ( (Unit!39570) )
))
(declare-fun lt!543114 () Unit!39569)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77494 (_ BitVec 64) (_ BitVec 32)) Unit!39569)

(assert (=> b!1197368 (= lt!543114 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47426 () Bool)

(declare-fun tp!90081 () Bool)

(declare-fun e!680214 () Bool)

(assert (=> mapNonEmpty!47426 (= mapRes!47426 (and tp!90081 e!680214))))

(declare-fun mapValue!47426 () ValueCell!14486)

(declare-fun mapKey!47426 () (_ BitVec 32))

(declare-fun mapRest!47426 () (Array (_ BitVec 32) ValueCell!14486))

(assert (=> mapNonEmpty!47426 (= (arr!37392 _values!996) (store mapRest!47426 mapKey!47426 mapValue!47426))))

(declare-fun b!1197369 () Bool)

(assert (=> b!1197369 (= e!680219 e!680216)))

(declare-fun res!796845 () Bool)

(assert (=> b!1197369 (=> (not res!796845) (not e!680216))))

(declare-fun lt!543113 () array!77494)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77494 (_ BitVec 32)) Bool)

(assert (=> b!1197369 (= res!796845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543113 mask!1564))))

(assert (=> b!1197369 (= lt!543113 (array!77495 (store (arr!37393 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37931 _keys!1208)))))

(declare-fun b!1197370 () Bool)

(declare-fun res!796843 () Bool)

(assert (=> b!1197370 (=> (not res!796843) (not e!680219))))

(assert (=> b!1197370 (= res!796843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197371 () Bool)

(declare-fun res!796847 () Bool)

(assert (=> b!1197371 (=> (not res!796847) (not e!680219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197371 (= res!796847 (validKeyInArray!0 k0!934))))

(declare-fun b!1197372 () Bool)

(declare-fun res!796840 () Bool)

(assert (=> b!1197372 (=> (not res!796840) (not e!680216))))

(declare-datatypes ((List!26401 0))(
  ( (Nil!26398) (Cons!26397 (h!27606 (_ BitVec 64)) (t!39093 List!26401)) )
))
(declare-fun arrayNoDuplicates!0 (array!77494 (_ BitVec 32) List!26401) Bool)

(assert (=> b!1197372 (= res!796840 (arrayNoDuplicates!0 lt!543113 #b00000000000000000000000000000000 Nil!26398))))

(declare-fun b!1197373 () Bool)

(declare-fun res!796841 () Bool)

(assert (=> b!1197373 (=> (not res!796841) (not e!680219))))

(assert (=> b!1197373 (= res!796841 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26398))))

(declare-fun b!1197374 () Bool)

(assert (=> b!1197374 (= e!680214 tp_is_empty!30391)))

(declare-fun b!1197375 () Bool)

(declare-fun res!796846 () Bool)

(assert (=> b!1197375 (=> (not res!796846) (not e!680219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197375 (= res!796846 (validMask!0 mask!1564))))

(declare-fun b!1197376 () Bool)

(declare-fun res!796844 () Bool)

(assert (=> b!1197376 (=> (not res!796844) (not e!680219))))

(assert (=> b!1197376 (= res!796844 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37931 _keys!1208))))))

(assert (= (and start!100340 res!796842) b!1197375))

(assert (= (and b!1197375 res!796846) b!1197364))

(assert (= (and b!1197364 res!796848) b!1197370))

(assert (= (and b!1197370 res!796843) b!1197373))

(assert (= (and b!1197373 res!796841) b!1197376))

(assert (= (and b!1197376 res!796844) b!1197371))

(assert (= (and b!1197371 res!796847) b!1197367))

(assert (= (and b!1197367 res!796839) b!1197369))

(assert (= (and b!1197369 res!796845) b!1197372))

(assert (= (and b!1197372 res!796840) b!1197368))

(assert (= (and b!1197365 condMapEmpty!47426) mapIsEmpty!47426))

(assert (= (and b!1197365 (not condMapEmpty!47426)) mapNonEmpty!47426))

(get-info :version)

(assert (= (and mapNonEmpty!47426 ((_ is ValueCellFull!14486) mapValue!47426)) b!1197374))

(assert (= (and b!1197365 ((_ is ValueCellFull!14486) mapDefault!47426)) b!1197366))

(assert (= start!100340 b!1197365))

(declare-fun m!1103919 () Bool)

(assert (=> b!1197368 m!1103919))

(declare-fun m!1103921 () Bool)

(assert (=> b!1197368 m!1103921))

(declare-fun m!1103923 () Bool)

(assert (=> mapNonEmpty!47426 m!1103923))

(declare-fun m!1103925 () Bool)

(assert (=> b!1197373 m!1103925))

(declare-fun m!1103927 () Bool)

(assert (=> b!1197367 m!1103927))

(declare-fun m!1103929 () Bool)

(assert (=> start!100340 m!1103929))

(declare-fun m!1103931 () Bool)

(assert (=> start!100340 m!1103931))

(declare-fun m!1103933 () Bool)

(assert (=> b!1197371 m!1103933))

(declare-fun m!1103935 () Bool)

(assert (=> b!1197369 m!1103935))

(declare-fun m!1103937 () Bool)

(assert (=> b!1197369 m!1103937))

(declare-fun m!1103939 () Bool)

(assert (=> b!1197370 m!1103939))

(declare-fun m!1103941 () Bool)

(assert (=> b!1197375 m!1103941))

(declare-fun m!1103943 () Bool)

(assert (=> b!1197372 m!1103943))

(check-sat (not b!1197370) (not b!1197373) (not b!1197369) (not b!1197372) (not b!1197375) (not mapNonEmpty!47426) (not b!1197368) (not b!1197371) tp_is_empty!30391 (not start!100340))
(check-sat)
