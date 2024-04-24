; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132266 () Bool)

(assert start!132266)

(declare-fun res!1059955 () Bool)

(declare-fun e!860642 () Bool)

(assert (=> start!132266 (=> (not res!1059955) (not e!860642))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132266 (= res!1059955 (validMask!0 mask!926))))

(assert (=> start!132266 e!860642))

(assert (=> start!132266 true))

(declare-datatypes ((V!58901 0))(
  ( (V!58902 (val!18999 Int)) )
))
(declare-datatypes ((ValueCell!18011 0))(
  ( (ValueCellFull!18011 (v!21792 V!58901)) (EmptyCell!18011) )
))
(declare-datatypes ((array!103026 0))(
  ( (array!103027 (arr!49708 (Array (_ BitVec 32) ValueCell!18011)) (size!50259 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103026)

(declare-fun e!860641 () Bool)

(declare-fun array_inv!38931 (array!103026) Bool)

(assert (=> start!132266 (and (array_inv!38931 _values!470) e!860641)))

(declare-datatypes ((array!103028 0))(
  ( (array!103029 (arr!49709 (Array (_ BitVec 32) (_ BitVec 64))) (size!50260 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103028)

(declare-fun array_inv!38932 (array!103028) Bool)

(assert (=> start!132266 (array_inv!38932 _keys!618)))

(declare-fun b!1546077 () Bool)

(declare-fun res!1059954 () Bool)

(assert (=> b!1546077 (=> (not res!1059954) (not e!860642))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546077 (= res!1059954 (and (= (size!50259 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50260 _keys!618) (size!50259 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546078 () Bool)

(declare-fun e!860640 () Bool)

(declare-fun tp_is_empty!37843 () Bool)

(assert (=> b!1546078 (= e!860640 tp_is_empty!37843)))

(declare-fun mapNonEmpty!58468 () Bool)

(declare-fun mapRes!58468 () Bool)

(declare-fun tp!110995 () Bool)

(declare-fun e!860639 () Bool)

(assert (=> mapNonEmpty!58468 (= mapRes!58468 (and tp!110995 e!860639))))

(declare-fun mapKey!58468 () (_ BitVec 32))

(declare-fun mapValue!58468 () ValueCell!18011)

(declare-fun mapRest!58468 () (Array (_ BitVec 32) ValueCell!18011))

(assert (=> mapNonEmpty!58468 (= (arr!49708 _values!470) (store mapRest!58468 mapKey!58468 mapValue!58468))))

(declare-fun b!1546079 () Bool)

(declare-fun res!1059956 () Bool)

(assert (=> b!1546079 (=> (not res!1059956) (not e!860642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103028 (_ BitVec 32)) Bool)

(assert (=> b!1546079 (= res!1059956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546080 () Bool)

(assert (=> b!1546080 (= e!860639 tp_is_empty!37843)))

(declare-fun mapIsEmpty!58468 () Bool)

(assert (=> mapIsEmpty!58468 mapRes!58468))

(declare-fun b!1546081 () Bool)

(assert (=> b!1546081 (= e!860641 (and e!860640 mapRes!58468))))

(declare-fun condMapEmpty!58468 () Bool)

(declare-fun mapDefault!58468 () ValueCell!18011)

(assert (=> b!1546081 (= condMapEmpty!58468 (= (arr!49708 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18011)) mapDefault!58468)))))

(declare-fun b!1546082 () Bool)

(assert (=> b!1546082 (= e!860642 false)))

(declare-fun lt!666925 () Bool)

(declare-datatypes ((List!35963 0))(
  ( (Nil!35960) (Cons!35959 (h!37422 (_ BitVec 64)) (t!50649 List!35963)) )
))
(declare-fun arrayNoDuplicates!0 (array!103028 (_ BitVec 32) List!35963) Bool)

(assert (=> b!1546082 (= lt!666925 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35960))))

(assert (= (and start!132266 res!1059955) b!1546077))

(assert (= (and b!1546077 res!1059954) b!1546079))

(assert (= (and b!1546079 res!1059956) b!1546082))

(assert (= (and b!1546081 condMapEmpty!58468) mapIsEmpty!58468))

(assert (= (and b!1546081 (not condMapEmpty!58468)) mapNonEmpty!58468))

(get-info :version)

(assert (= (and mapNonEmpty!58468 ((_ is ValueCellFull!18011) mapValue!58468)) b!1546080))

(assert (= (and b!1546081 ((_ is ValueCellFull!18011) mapDefault!58468)) b!1546078))

(assert (= start!132266 b!1546081))

(declare-fun m!1427139 () Bool)

(assert (=> start!132266 m!1427139))

(declare-fun m!1427141 () Bool)

(assert (=> start!132266 m!1427141))

(declare-fun m!1427143 () Bool)

(assert (=> start!132266 m!1427143))

(declare-fun m!1427145 () Bool)

(assert (=> mapNonEmpty!58468 m!1427145))

(declare-fun m!1427147 () Bool)

(assert (=> b!1546079 m!1427147))

(declare-fun m!1427149 () Bool)

(assert (=> b!1546082 m!1427149))

(check-sat tp_is_empty!37843 (not start!132266) (not mapNonEmpty!58468) (not b!1546079) (not b!1546082))
(check-sat)
