; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131878 () Bool)

(assert start!131878)

(declare-fun b!1543857 () Bool)

(declare-fun e!859312 () Bool)

(declare-fun tp_is_empty!37867 () Bool)

(assert (=> b!1543857 (= e!859312 tp_is_empty!37867)))

(declare-fun b!1543858 () Bool)

(declare-fun res!1059203 () Bool)

(declare-fun e!859310 () Bool)

(assert (=> b!1543858 (=> (not res!1059203) (not e!859310))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58933 0))(
  ( (V!58934 (val!19011 Int)) )
))
(declare-datatypes ((ValueCell!18023 0))(
  ( (ValueCellFull!18023 (v!21812 V!58933)) (EmptyCell!18023) )
))
(declare-datatypes ((array!102948 0))(
  ( (array!102949 (arr!49676 (Array (_ BitVec 32) ValueCell!18023)) (size!50226 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102948)

(declare-datatypes ((array!102950 0))(
  ( (array!102951 (arr!49677 (Array (_ BitVec 32) (_ BitVec 64))) (size!50227 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102950)

(assert (=> b!1543858 (= res!1059203 (and (= (size!50226 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50227 _keys!618) (size!50226 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58504 () Bool)

(declare-fun mapRes!58504 () Bool)

(declare-fun tp!111031 () Bool)

(declare-fun e!859311 () Bool)

(assert (=> mapNonEmpty!58504 (= mapRes!58504 (and tp!111031 e!859311))))

(declare-fun mapRest!58504 () (Array (_ BitVec 32) ValueCell!18023))

(declare-fun mapKey!58504 () (_ BitVec 32))

(declare-fun mapValue!58504 () ValueCell!18023)

(assert (=> mapNonEmpty!58504 (= (arr!49676 _values!470) (store mapRest!58504 mapKey!58504 mapValue!58504))))

(declare-fun b!1543859 () Bool)

(assert (=> b!1543859 (= e!859310 false)))

(declare-fun lt!666053 () Bool)

(declare-datatypes ((List!35933 0))(
  ( (Nil!35930) (Cons!35929 (h!37374 (_ BitVec 64)) (t!50627 List!35933)) )
))
(declare-fun arrayNoDuplicates!0 (array!102950 (_ BitVec 32) List!35933) Bool)

(assert (=> b!1543859 (= lt!666053 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35930))))

(declare-fun b!1543860 () Bool)

(declare-fun res!1059202 () Bool)

(assert (=> b!1543860 (=> (not res!1059202) (not e!859310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102950 (_ BitVec 32)) Bool)

(assert (=> b!1543860 (= res!1059202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543861 () Bool)

(assert (=> b!1543861 (= e!859311 tp_is_empty!37867)))

(declare-fun mapIsEmpty!58504 () Bool)

(assert (=> mapIsEmpty!58504 mapRes!58504))

(declare-fun b!1543862 () Bool)

(declare-fun e!859313 () Bool)

(assert (=> b!1543862 (= e!859313 (and e!859312 mapRes!58504))))

(declare-fun condMapEmpty!58504 () Bool)

(declare-fun mapDefault!58504 () ValueCell!18023)

