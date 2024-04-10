; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93678 () Bool)

(assert start!93678)

(declare-fun b!1059771 () Bool)

(declare-fun e!603254 () Bool)

(assert (=> b!1059771 (= e!603254 false)))

(declare-fun lt!467179 () Bool)

(declare-datatypes ((array!66989 0))(
  ( (array!66990 (arr!32204 (Array (_ BitVec 32) (_ BitVec 64))) (size!32740 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66989)

(declare-datatypes ((List!22442 0))(
  ( (Nil!22439) (Cons!22438 (h!23647 (_ BitVec 64)) (t!31749 List!22442)) )
))
(declare-fun arrayNoDuplicates!0 (array!66989 (_ BitVec 32) List!22442) Bool)

(assert (=> b!1059771 (= lt!467179 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22439))))

(declare-fun mapNonEmpty!39139 () Bool)

(declare-fun mapRes!39139 () Bool)

(declare-fun tp!74945 () Bool)

(declare-fun e!603256 () Bool)

(assert (=> mapNonEmpty!39139 (= mapRes!39139 (and tp!74945 e!603256))))

(declare-fun mapKey!39139 () (_ BitVec 32))

(declare-datatypes ((V!38445 0))(
  ( (V!38446 (val!12542 Int)) )
))
(declare-datatypes ((ValueCell!11788 0))(
  ( (ValueCellFull!11788 (v!15152 V!38445)) (EmptyCell!11788) )
))
(declare-fun mapRest!39139 () (Array (_ BitVec 32) ValueCell!11788))

(declare-fun mapValue!39139 () ValueCell!11788)

(declare-datatypes ((array!66991 0))(
  ( (array!66992 (arr!32205 (Array (_ BitVec 32) ValueCell!11788)) (size!32741 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66991)

(assert (=> mapNonEmpty!39139 (= (arr!32205 _values!955) (store mapRest!39139 mapKey!39139 mapValue!39139))))

(declare-fun b!1059772 () Bool)

(declare-fun e!603257 () Bool)

(declare-fun e!603255 () Bool)

(assert (=> b!1059772 (= e!603257 (and e!603255 mapRes!39139))))

(declare-fun condMapEmpty!39139 () Bool)

(declare-fun mapDefault!39139 () ValueCell!11788)

