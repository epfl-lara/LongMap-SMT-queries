; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84448 () Bool)

(assert start!84448)

(declare-fun b!986896 () Bool)

(declare-fun e!556418 () Bool)

(assert (=> b!986896 (= e!556418 false)))

(declare-fun lt!437781 () Bool)

(declare-datatypes ((array!62178 0))(
  ( (array!62179 (arr!29942 (Array (_ BitVec 32) (_ BitVec 64))) (size!30422 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62178)

(declare-datatypes ((List!20726 0))(
  ( (Nil!20723) (Cons!20722 (h!21890 (_ BitVec 64)) (t!29617 List!20726)) )
))
(declare-fun arrayNoDuplicates!0 (array!62178 (_ BitVec 32) List!20726) Bool)

(assert (=> b!986896 (= lt!437781 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20723))))

(declare-fun res!660099 () Bool)

(assert (=> start!84448 (=> (not res!660099) (not e!556418))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84448 (= res!660099 (validMask!0 mask!1948))))

(assert (=> start!84448 e!556418))

(assert (=> start!84448 true))

(declare-datatypes ((V!35761 0))(
  ( (V!35762 (val!11592 Int)) )
))
(declare-datatypes ((ValueCell!11060 0))(
  ( (ValueCellFull!11060 (v!14151 V!35761)) (EmptyCell!11060) )
))
(declare-datatypes ((array!62180 0))(
  ( (array!62181 (arr!29943 (Array (_ BitVec 32) ValueCell!11060)) (size!30423 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62180)

(declare-fun e!556419 () Bool)

(declare-fun array_inv!23159 (array!62180) Bool)

(assert (=> start!84448 (and (array_inv!23159 _values!1278) e!556419)))

(declare-fun array_inv!23160 (array!62178) Bool)

(assert (=> start!84448 (array_inv!23160 _keys!1544)))

(declare-fun b!986897 () Bool)

(declare-fun res!660100 () Bool)

(assert (=> b!986897 (=> (not res!660100) (not e!556418))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986897 (= res!660100 (and (= (size!30423 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30422 _keys!1544) (size!30423 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986898 () Bool)

(declare-fun e!556417 () Bool)

(declare-fun mapRes!36653 () Bool)

(assert (=> b!986898 (= e!556419 (and e!556417 mapRes!36653))))

(declare-fun condMapEmpty!36653 () Bool)

(declare-fun mapDefault!36653 () ValueCell!11060)

(assert (=> b!986898 (= condMapEmpty!36653 (= (arr!29943 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11060)) mapDefault!36653)))))

(declare-fun b!986899 () Bool)

(declare-fun tp_is_empty!23083 () Bool)

(assert (=> b!986899 (= e!556417 tp_is_empty!23083)))

(declare-fun mapIsEmpty!36653 () Bool)

(assert (=> mapIsEmpty!36653 mapRes!36653))

(declare-fun b!986900 () Bool)

(declare-fun e!556416 () Bool)

(assert (=> b!986900 (= e!556416 tp_is_empty!23083)))

(declare-fun b!986901 () Bool)

(declare-fun res!660098 () Bool)

(assert (=> b!986901 (=> (not res!660098) (not e!556418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62178 (_ BitVec 32)) Bool)

(assert (=> b!986901 (= res!660098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36653 () Bool)

(declare-fun tp!69509 () Bool)

(assert (=> mapNonEmpty!36653 (= mapRes!36653 (and tp!69509 e!556416))))

(declare-fun mapRest!36653 () (Array (_ BitVec 32) ValueCell!11060))

(declare-fun mapValue!36653 () ValueCell!11060)

(declare-fun mapKey!36653 () (_ BitVec 32))

(assert (=> mapNonEmpty!36653 (= (arr!29943 _values!1278) (store mapRest!36653 mapKey!36653 mapValue!36653))))

(assert (= (and start!84448 res!660099) b!986897))

(assert (= (and b!986897 res!660100) b!986901))

(assert (= (and b!986901 res!660098) b!986896))

(assert (= (and b!986898 condMapEmpty!36653) mapIsEmpty!36653))

(assert (= (and b!986898 (not condMapEmpty!36653)) mapNonEmpty!36653))

(get-info :version)

(assert (= (and mapNonEmpty!36653 ((_ is ValueCellFull!11060) mapValue!36653)) b!986900))

(assert (= (and b!986898 ((_ is ValueCellFull!11060) mapDefault!36653)) b!986899))

(assert (= start!84448 b!986898))

(declare-fun m!914273 () Bool)

(assert (=> b!986896 m!914273))

(declare-fun m!914275 () Bool)

(assert (=> start!84448 m!914275))

(declare-fun m!914277 () Bool)

(assert (=> start!84448 m!914277))

(declare-fun m!914279 () Bool)

(assert (=> start!84448 m!914279))

(declare-fun m!914281 () Bool)

(assert (=> b!986901 m!914281))

(declare-fun m!914283 () Bool)

(assert (=> mapNonEmpty!36653 m!914283))

(check-sat (not mapNonEmpty!36653) (not b!986896) (not b!986901) (not start!84448) tp_is_empty!23083)
(check-sat)
