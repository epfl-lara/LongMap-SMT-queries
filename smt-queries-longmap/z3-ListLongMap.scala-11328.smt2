; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131874 () Bool)

(assert start!131874)

(declare-fun res!1059184 () Bool)

(declare-fun e!859284 () Bool)

(assert (=> start!131874 (=> (not res!1059184) (not e!859284))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131874 (= res!1059184 (validMask!0 mask!926))))

(assert (=> start!131874 e!859284))

(assert (=> start!131874 true))

(declare-datatypes ((V!58927 0))(
  ( (V!58928 (val!19009 Int)) )
))
(declare-datatypes ((ValueCell!18021 0))(
  ( (ValueCellFull!18021 (v!21810 V!58927)) (EmptyCell!18021) )
))
(declare-datatypes ((array!102942 0))(
  ( (array!102943 (arr!49673 (Array (_ BitVec 32) ValueCell!18021)) (size!50223 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102942)

(declare-fun e!859281 () Bool)

(declare-fun array_inv!38641 (array!102942) Bool)

(assert (=> start!131874 (and (array_inv!38641 _values!470) e!859281)))

(declare-datatypes ((array!102944 0))(
  ( (array!102945 (arr!49674 (Array (_ BitVec 32) (_ BitVec 64))) (size!50224 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102944)

(declare-fun array_inv!38642 (array!102944) Bool)

(assert (=> start!131874 (array_inv!38642 _keys!618)))

(declare-fun mapNonEmpty!58498 () Bool)

(declare-fun mapRes!58498 () Bool)

(declare-fun tp!111025 () Bool)

(declare-fun e!859280 () Bool)

(assert (=> mapNonEmpty!58498 (= mapRes!58498 (and tp!111025 e!859280))))

(declare-fun mapValue!58498 () ValueCell!18021)

(declare-fun mapRest!58498 () (Array (_ BitVec 32) ValueCell!18021))

(declare-fun mapKey!58498 () (_ BitVec 32))

(assert (=> mapNonEmpty!58498 (= (arr!49673 _values!470) (store mapRest!58498 mapKey!58498 mapValue!58498))))

(declare-fun b!1543821 () Bool)

(assert (=> b!1543821 (= e!859284 false)))

(declare-fun lt!666047 () Bool)

(declare-datatypes ((List!35932 0))(
  ( (Nil!35929) (Cons!35928 (h!37373 (_ BitVec 64)) (t!50626 List!35932)) )
))
(declare-fun arrayNoDuplicates!0 (array!102944 (_ BitVec 32) List!35932) Bool)

(assert (=> b!1543821 (= lt!666047 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35929))))

(declare-fun b!1543822 () Bool)

(declare-fun e!859282 () Bool)

(assert (=> b!1543822 (= e!859281 (and e!859282 mapRes!58498))))

(declare-fun condMapEmpty!58498 () Bool)

(declare-fun mapDefault!58498 () ValueCell!18021)

(assert (=> b!1543822 (= condMapEmpty!58498 (= (arr!49673 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18021)) mapDefault!58498)))))

(declare-fun mapIsEmpty!58498 () Bool)

(assert (=> mapIsEmpty!58498 mapRes!58498))

(declare-fun b!1543823 () Bool)

(declare-fun tp_is_empty!37863 () Bool)

(assert (=> b!1543823 (= e!859280 tp_is_empty!37863)))

(declare-fun b!1543824 () Bool)

(assert (=> b!1543824 (= e!859282 tp_is_empty!37863)))

(declare-fun b!1543825 () Bool)

(declare-fun res!1059185 () Bool)

(assert (=> b!1543825 (=> (not res!1059185) (not e!859284))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543825 (= res!1059185 (and (= (size!50223 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50224 _keys!618) (size!50223 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543826 () Bool)

(declare-fun res!1059186 () Bool)

(assert (=> b!1543826 (=> (not res!1059186) (not e!859284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102944 (_ BitVec 32)) Bool)

(assert (=> b!1543826 (= res!1059186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131874 res!1059184) b!1543825))

(assert (= (and b!1543825 res!1059185) b!1543826))

(assert (= (and b!1543826 res!1059186) b!1543821))

(assert (= (and b!1543822 condMapEmpty!58498) mapIsEmpty!58498))

(assert (= (and b!1543822 (not condMapEmpty!58498)) mapNonEmpty!58498))

(get-info :version)

(assert (= (and mapNonEmpty!58498 ((_ is ValueCellFull!18021) mapValue!58498)) b!1543823))

(assert (= (and b!1543822 ((_ is ValueCellFull!18021) mapDefault!58498)) b!1543824))

(assert (= start!131874 b!1543822))

(declare-fun m!1425001 () Bool)

(assert (=> start!131874 m!1425001))

(declare-fun m!1425003 () Bool)

(assert (=> start!131874 m!1425003))

(declare-fun m!1425005 () Bool)

(assert (=> start!131874 m!1425005))

(declare-fun m!1425007 () Bool)

(assert (=> mapNonEmpty!58498 m!1425007))

(declare-fun m!1425009 () Bool)

(assert (=> b!1543821 m!1425009))

(declare-fun m!1425011 () Bool)

(assert (=> b!1543826 m!1425011))

(check-sat tp_is_empty!37863 (not start!131874) (not b!1543821) (not b!1543826) (not mapNonEmpty!58498))
(check-sat)
