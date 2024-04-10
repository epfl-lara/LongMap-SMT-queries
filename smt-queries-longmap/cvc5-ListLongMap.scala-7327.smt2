; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93644 () Bool)

(assert start!93644)

(declare-fun mapNonEmpty!39088 () Bool)

(declare-fun mapRes!39088 () Bool)

(declare-fun tp!74894 () Bool)

(declare-fun e!602999 () Bool)

(assert (=> mapNonEmpty!39088 (= mapRes!39088 (and tp!74894 e!602999))))

(declare-datatypes ((V!38401 0))(
  ( (V!38402 (val!12525 Int)) )
))
(declare-datatypes ((ValueCell!11771 0))(
  ( (ValueCellFull!11771 (v!15135 V!38401)) (EmptyCell!11771) )
))
(declare-fun mapValue!39088 () ValueCell!11771)

(declare-datatypes ((array!66929 0))(
  ( (array!66930 (arr!32174 (Array (_ BitVec 32) ValueCell!11771)) (size!32710 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66929)

(declare-fun mapRest!39088 () (Array (_ BitVec 32) ValueCell!11771))

(declare-fun mapKey!39088 () (_ BitVec 32))

(assert (=> mapNonEmpty!39088 (= (arr!32174 _values!955) (store mapRest!39088 mapKey!39088 mapValue!39088))))

(declare-fun b!1059465 () Bool)

(declare-fun e!603003 () Bool)

(assert (=> b!1059465 (= e!603003 false)))

(declare-fun lt!467128 () Bool)

(declare-datatypes ((array!66931 0))(
  ( (array!66932 (arr!32175 (Array (_ BitVec 32) (_ BitVec 64))) (size!32711 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66931)

(declare-datatypes ((List!22431 0))(
  ( (Nil!22428) (Cons!22427 (h!23636 (_ BitVec 64)) (t!31738 List!22431)) )
))
(declare-fun arrayNoDuplicates!0 (array!66931 (_ BitVec 32) List!22431) Bool)

(assert (=> b!1059465 (= lt!467128 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22428))))

(declare-fun b!1059466 () Bool)

(declare-fun tp_is_empty!24949 () Bool)

(assert (=> b!1059466 (= e!602999 tp_is_empty!24949)))

(declare-fun b!1059467 () Bool)

(declare-fun res!707736 () Bool)

(assert (=> b!1059467 (=> (not res!707736) (not e!603003))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66931 (_ BitVec 32)) Bool)

(assert (=> b!1059467 (= res!707736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059468 () Bool)

(declare-fun e!603000 () Bool)

(assert (=> b!1059468 (= e!603000 tp_is_empty!24949)))

(declare-fun b!1059469 () Bool)

(declare-fun e!603002 () Bool)

(assert (=> b!1059469 (= e!603002 (and e!603000 mapRes!39088))))

(declare-fun condMapEmpty!39088 () Bool)

(declare-fun mapDefault!39088 () ValueCell!11771)

