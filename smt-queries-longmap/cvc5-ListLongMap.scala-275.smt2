; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4476 () Bool)

(assert start!4476)

(declare-fun b_free!1237 () Bool)

(declare-fun b_next!1237 () Bool)

(assert (=> start!4476 (= b_free!1237 (not b_next!1237))))

(declare-fun tp!5149 () Bool)

(declare-fun b_and!2059 () Bool)

(assert (=> start!4476 (= tp!5149 b_and!2059)))

(declare-fun mapIsEmpty!1933 () Bool)

(declare-fun mapRes!1933 () Bool)

(assert (=> mapIsEmpty!1933 mapRes!1933))

(declare-fun b!34771 () Bool)

(declare-fun e!22011 () Bool)

(declare-fun tp_is_empty!1591 () Bool)

(assert (=> b!34771 (= e!22011 tp_is_empty!1591)))

(declare-fun b!34772 () Bool)

(declare-fun res!21123 () Bool)

(declare-fun e!22014 () Bool)

(assert (=> b!34772 (=> (not res!21123) (not e!22014))))

(declare-datatypes ((array!2395 0))(
  ( (array!2396 (arr!1145 (Array (_ BitVec 32) (_ BitVec 64))) (size!1246 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2395)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2395 (_ BitVec 32)) Bool)

(assert (=> b!34772 (= res!21123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1933 () Bool)

(declare-fun tp!5148 () Bool)

(declare-fun e!22015 () Bool)

(assert (=> mapNonEmpty!1933 (= mapRes!1933 (and tp!5148 e!22015))))

(declare-datatypes ((V!1947 0))(
  ( (V!1948 (val!822 Int)) )
))
(declare-datatypes ((ValueCell!596 0))(
  ( (ValueCellFull!596 (v!1917 V!1947)) (EmptyCell!596) )
))
(declare-fun mapValue!1933 () ValueCell!596)

(declare-fun mapKey!1933 () (_ BitVec 32))

(declare-fun mapRest!1933 () (Array (_ BitVec 32) ValueCell!596))

(declare-datatypes ((array!2397 0))(
  ( (array!2398 (arr!1146 (Array (_ BitVec 32) ValueCell!596)) (size!1247 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2397)

(assert (=> mapNonEmpty!1933 (= (arr!1146 _values!1501) (store mapRest!1933 mapKey!1933 mapValue!1933))))

(declare-fun b!34773 () Bool)

(assert (=> b!34773 (= e!22014 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!150 0))(
  ( (MissingZero!150 (index!2722 (_ BitVec 32))) (Found!150 (index!2723 (_ BitVec 32))) (Intermediate!150 (undefined!962 Bool) (index!2724 (_ BitVec 32)) (x!6952 (_ BitVec 32))) (Undefined!150) (MissingVacant!150 (index!2725 (_ BitVec 32))) )
))
(declare-fun lt!12813 () SeekEntryResult!150)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2395 (_ BitVec 32)) SeekEntryResult!150)

(assert (=> b!34773 (= lt!12813 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!34774 () Bool)

(declare-fun res!21122 () Bool)

(assert (=> b!34774 (=> (not res!21122) (not e!22014))))

(declare-datatypes ((List!920 0))(
  ( (Nil!917) (Cons!916 (h!1483 (_ BitVec 64)) (t!3625 List!920)) )
))
(declare-fun arrayNoDuplicates!0 (array!2395 (_ BitVec 32) List!920) Bool)

(assert (=> b!34774 (= res!21122 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!917))))

(declare-fun b!34776 () Bool)

(declare-fun res!21125 () Bool)

(assert (=> b!34776 (=> (not res!21125) (not e!22014))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34776 (= res!21125 (and (= (size!1247 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1246 _keys!1833) (size!1247 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34777 () Bool)

(declare-fun e!22012 () Bool)

(assert (=> b!34777 (= e!22012 (and e!22011 mapRes!1933))))

(declare-fun condMapEmpty!1933 () Bool)

(declare-fun mapDefault!1933 () ValueCell!596)

