; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35814 () Bool)

(assert start!35814)

(declare-fun b!359710 () Bool)

(declare-fun e!220309 () Bool)

(declare-fun tp_is_empty!8281 () Bool)

(assert (=> b!359710 (= e!220309 tp_is_empty!8281)))

(declare-fun b!359711 () Bool)

(declare-fun res!200000 () Bool)

(declare-fun e!220310 () Bool)

(assert (=> b!359711 (=> (not res!200000) (not e!220310))))

(declare-datatypes ((array!20087 0))(
  ( (array!20088 (arr!9537 (Array (_ BitVec 32) (_ BitVec 64))) (size!9890 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20087)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359711 (= res!200000 (not (= (select (arr!9537 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13929 () Bool)

(declare-fun mapRes!13929 () Bool)

(declare-fun tp!27996 () Bool)

(assert (=> mapNonEmpty!13929 (= mapRes!13929 (and tp!27996 e!220309))))

(declare-datatypes ((V!12019 0))(
  ( (V!12020 (val!4185 Int)) )
))
(declare-datatypes ((ValueCell!3797 0))(
  ( (ValueCellFull!3797 (v!6373 V!12019)) (EmptyCell!3797) )
))
(declare-fun mapRest!13929 () (Array (_ BitVec 32) ValueCell!3797))

(declare-fun mapKey!13929 () (_ BitVec 32))

(declare-datatypes ((array!20089 0))(
  ( (array!20090 (arr!9538 (Array (_ BitVec 32) ValueCell!3797)) (size!9891 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20089)

(declare-fun mapValue!13929 () ValueCell!3797)

(assert (=> mapNonEmpty!13929 (= (arr!9538 _values!1208) (store mapRest!13929 mapKey!13929 mapValue!13929))))

(declare-fun res!200001 () Bool)

(assert (=> start!35814 (=> (not res!200001) (not e!220310))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35814 (= res!200001 (validMask!0 mask!1842))))

(assert (=> start!35814 e!220310))

(assert (=> start!35814 tp_is_empty!8281))

(assert (=> start!35814 true))

(declare-fun array_inv!7032 (array!20087) Bool)

(assert (=> start!35814 (array_inv!7032 _keys!1456)))

(declare-fun e!220311 () Bool)

(declare-fun array_inv!7033 (array!20089) Bool)

(assert (=> start!35814 (and (array_inv!7033 _values!1208) e!220311)))

(declare-fun b!359712 () Bool)

(assert (=> b!359712 (= e!220310 (not true))))

(declare-fun arrayContainsKey!0 (array!20087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359712 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12019)

(declare-datatypes ((Unit!11048 0))(
  ( (Unit!11049) )
))
(declare-fun lt!166174 () Unit!11048)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12019)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!47 (array!20087 array!20089 (_ BitVec 32) (_ BitVec 32) V!12019 V!12019 (_ BitVec 64) (_ BitVec 32)) Unit!11048)

(assert (=> b!359712 (= lt!166174 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!47 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359713 () Bool)

(declare-fun res!199998 () Bool)

(assert (=> b!359713 (=> (not res!199998) (not e!220310))))

(assert (=> b!359713 (= res!199998 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9890 _keys!1456))))))

(declare-fun mapIsEmpty!13929 () Bool)

(assert (=> mapIsEmpty!13929 mapRes!13929))

(declare-fun b!359714 () Bool)

(declare-fun e!220307 () Bool)

(assert (=> b!359714 (= e!220311 (and e!220307 mapRes!13929))))

(declare-fun condMapEmpty!13929 () Bool)

(declare-fun mapDefault!13929 () ValueCell!3797)

(assert (=> b!359714 (= condMapEmpty!13929 (= (arr!9538 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3797)) mapDefault!13929)))))

(declare-fun b!359715 () Bool)

(declare-fun res!200002 () Bool)

(assert (=> b!359715 (=> (not res!200002) (not e!220310))))

(declare-datatypes ((List!5447 0))(
  ( (Nil!5444) (Cons!5443 (h!6299 (_ BitVec 64)) (t!10588 List!5447)) )
))
(declare-fun arrayNoDuplicates!0 (array!20087 (_ BitVec 32) List!5447) Bool)

(assert (=> b!359715 (= res!200002 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5444))))

(declare-fun b!359716 () Bool)

(declare-fun res!199999 () Bool)

(assert (=> b!359716 (=> (not res!199999) (not e!220310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359716 (= res!199999 (validKeyInArray!0 k0!1077))))

(declare-fun b!359717 () Bool)

(assert (=> b!359717 (= e!220307 tp_is_empty!8281)))

(declare-fun b!359718 () Bool)

(declare-fun res!199996 () Bool)

(assert (=> b!359718 (=> (not res!199996) (not e!220310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20087 (_ BitVec 32)) Bool)

(assert (=> b!359718 (= res!199996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359719 () Bool)

(declare-fun res!199997 () Bool)

(assert (=> b!359719 (=> (not res!199997) (not e!220310))))

(assert (=> b!359719 (= res!199997 (and (= (size!9891 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9890 _keys!1456) (size!9891 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359720 () Bool)

(declare-fun res!199995 () Bool)

(assert (=> b!359720 (=> (not res!199995) (not e!220310))))

(assert (=> b!359720 (= res!199995 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35814 res!200001) b!359719))

(assert (= (and b!359719 res!199997) b!359718))

(assert (= (and b!359718 res!199996) b!359715))

(assert (= (and b!359715 res!200002) b!359716))

(assert (= (and b!359716 res!199999) b!359713))

(assert (= (and b!359713 res!199998) b!359720))

(assert (= (and b!359720 res!199995) b!359711))

(assert (= (and b!359711 res!200000) b!359712))

(assert (= (and b!359714 condMapEmpty!13929) mapIsEmpty!13929))

(assert (= (and b!359714 (not condMapEmpty!13929)) mapNonEmpty!13929))

(get-info :version)

(assert (= (and mapNonEmpty!13929 ((_ is ValueCellFull!3797) mapValue!13929)) b!359710))

(assert (= (and b!359714 ((_ is ValueCellFull!3797) mapDefault!13929)) b!359717))

(assert (= start!35814 b!359714))

(declare-fun m!356571 () Bool)

(assert (=> b!359712 m!356571))

(declare-fun m!356573 () Bool)

(assert (=> b!359712 m!356573))

(declare-fun m!356575 () Bool)

(assert (=> b!359718 m!356575))

(declare-fun m!356577 () Bool)

(assert (=> b!359720 m!356577))

(declare-fun m!356579 () Bool)

(assert (=> mapNonEmpty!13929 m!356579))

(declare-fun m!356581 () Bool)

(assert (=> b!359715 m!356581))

(declare-fun m!356583 () Bool)

(assert (=> b!359711 m!356583))

(declare-fun m!356585 () Bool)

(assert (=> b!359716 m!356585))

(declare-fun m!356587 () Bool)

(assert (=> start!35814 m!356587))

(declare-fun m!356589 () Bool)

(assert (=> start!35814 m!356589))

(declare-fun m!356591 () Bool)

(assert (=> start!35814 m!356591))

(check-sat (not b!359718) tp_is_empty!8281 (not b!359720) (not b!359715) (not mapNonEmpty!13929) (not start!35814) (not b!359716) (not b!359712))
(check-sat)
