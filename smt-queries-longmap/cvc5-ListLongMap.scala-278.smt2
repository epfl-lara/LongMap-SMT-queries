; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4494 () Bool)

(assert start!4494)

(declare-fun b_free!1255 () Bool)

(declare-fun b_next!1255 () Bool)

(assert (=> start!4494 (= b_free!1255 (not b_next!1255))))

(declare-fun tp!5202 () Bool)

(declare-fun b_and!2077 () Bool)

(assert (=> start!4494 (= tp!5202 b_and!2077)))

(declare-fun b!35041 () Bool)

(declare-fun res!21310 () Bool)

(declare-fun e!22150 () Bool)

(assert (=> b!35041 (=> (not res!21310) (not e!22150))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1971 0))(
  ( (V!1972 (val!831 Int)) )
))
(declare-datatypes ((ValueCell!605 0))(
  ( (ValueCellFull!605 (v!1926 V!1971)) (EmptyCell!605) )
))
(declare-datatypes ((array!2431 0))(
  ( (array!2432 (arr!1163 (Array (_ BitVec 32) ValueCell!605)) (size!1264 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2431)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2433 0))(
  ( (array!2434 (arr!1164 (Array (_ BitVec 32) (_ BitVec 64))) (size!1265 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2433)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1971)

(declare-fun minValue!1443 () V!1971)

(declare-datatypes ((tuple2!1344 0))(
  ( (tuple2!1345 (_1!683 (_ BitVec 64)) (_2!683 V!1971)) )
))
(declare-datatypes ((List!935 0))(
  ( (Nil!932) (Cons!931 (h!1498 tuple2!1344) (t!3640 List!935)) )
))
(declare-datatypes ((ListLongMap!921 0))(
  ( (ListLongMap!922 (toList!476 List!935)) )
))
(declare-fun contains!422 (ListLongMap!921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!300 (array!2433 array!2431 (_ BitVec 32) (_ BitVec 32) V!1971 V!1971 (_ BitVec 32) Int) ListLongMap!921)

(assert (=> b!35041 (= res!21310 (not (contains!422 (getCurrentListMap!300 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!35042 () Bool)

(declare-fun res!21314 () Bool)

(assert (=> b!35042 (=> (not res!21314) (not e!22150))))

(declare-datatypes ((List!936 0))(
  ( (Nil!933) (Cons!932 (h!1499 (_ BitVec 64)) (t!3641 List!936)) )
))
(declare-fun arrayNoDuplicates!0 (array!2433 (_ BitVec 32) List!936) Bool)

(assert (=> b!35042 (= res!21314 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!933))))

(declare-fun mapIsEmpty!1960 () Bool)

(declare-fun mapRes!1960 () Bool)

(assert (=> mapIsEmpty!1960 mapRes!1960))

(declare-fun res!21311 () Bool)

(assert (=> start!4494 (=> (not res!21311) (not e!22150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4494 (= res!21311 (validMask!0 mask!2294))))

(assert (=> start!4494 e!22150))

(assert (=> start!4494 true))

(assert (=> start!4494 tp!5202))

(declare-fun e!22146 () Bool)

(declare-fun array_inv!821 (array!2431) Bool)

(assert (=> start!4494 (and (array_inv!821 _values!1501) e!22146)))

(declare-fun array_inv!822 (array!2433) Bool)

(assert (=> start!4494 (array_inv!822 _keys!1833)))

(declare-fun tp_is_empty!1609 () Bool)

(assert (=> start!4494 tp_is_empty!1609))

(declare-fun b!35043 () Bool)

(declare-datatypes ((SeekEntryResult!158 0))(
  ( (MissingZero!158 (index!2754 (_ BitVec 32))) (Found!158 (index!2755 (_ BitVec 32))) (Intermediate!158 (undefined!970 Bool) (index!2756 (_ BitVec 32)) (x!6984 (_ BitVec 32))) (Undefined!158) (MissingVacant!158 (index!2757 (_ BitVec 32))) )
))
(declare-fun lt!12840 () SeekEntryResult!158)

(assert (=> b!35043 (= e!22150 (and (is-Found!158 lt!12840) (or (bvslt (index!2755 lt!12840) #b00000000000000000000000000000000) (bvsge (index!2755 lt!12840) (size!1265 _keys!1833)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2433 (_ BitVec 32)) SeekEntryResult!158)

(assert (=> b!35043 (= lt!12840 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1960 () Bool)

(declare-fun tp!5203 () Bool)

(declare-fun e!22147 () Bool)

(assert (=> mapNonEmpty!1960 (= mapRes!1960 (and tp!5203 e!22147))))

(declare-fun mapValue!1960 () ValueCell!605)

(declare-fun mapKey!1960 () (_ BitVec 32))

(declare-fun mapRest!1960 () (Array (_ BitVec 32) ValueCell!605))

(assert (=> mapNonEmpty!1960 (= (arr!1163 _values!1501) (store mapRest!1960 mapKey!1960 mapValue!1960))))

(declare-fun b!35044 () Bool)

(declare-fun e!22149 () Bool)

(assert (=> b!35044 (= e!22146 (and e!22149 mapRes!1960))))

(declare-fun condMapEmpty!1960 () Bool)

(declare-fun mapDefault!1960 () ValueCell!605)

