; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4492 () Bool)

(assert start!4492)

(declare-fun b_free!1253 () Bool)

(declare-fun b_next!1253 () Bool)

(assert (=> start!4492 (= b_free!1253 (not b_next!1253))))

(declare-fun tp!5197 () Bool)

(declare-fun b_and!2075 () Bool)

(assert (=> start!4492 (= tp!5197 b_and!2075)))

(declare-fun b!35011 () Bool)

(declare-fun e!22133 () Bool)

(declare-fun tp_is_empty!1607 () Bool)

(assert (=> b!35011 (= e!22133 tp_is_empty!1607)))

(declare-fun b!35012 () Bool)

(declare-fun e!22135 () Bool)

(assert (=> b!35012 (= e!22135 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!2427 0))(
  ( (array!2428 (arr!1161 (Array (_ BitVec 32) (_ BitVec 64))) (size!1262 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2427)

(declare-datatypes ((SeekEntryResult!157 0))(
  ( (MissingZero!157 (index!2750 (_ BitVec 32))) (Found!157 (index!2751 (_ BitVec 32))) (Intermediate!157 (undefined!969 Bool) (index!2752 (_ BitVec 32)) (x!6975 (_ BitVec 32))) (Undefined!157) (MissingVacant!157 (index!2753 (_ BitVec 32))) )
))
(declare-fun lt!12837 () SeekEntryResult!157)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2427 (_ BitVec 32)) SeekEntryResult!157)

(assert (=> b!35012 (= lt!12837 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!35013 () Bool)

(declare-fun res!21288 () Bool)

(assert (=> b!35013 (=> (not res!21288) (not e!22135))))

(declare-datatypes ((List!934 0))(
  ( (Nil!931) (Cons!930 (h!1497 (_ BitVec 64)) (t!3639 List!934)) )
))
(declare-fun arrayNoDuplicates!0 (array!2427 (_ BitVec 32) List!934) Bool)

(assert (=> b!35013 (= res!21288 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!931))))

(declare-fun b!35014 () Bool)

(declare-fun res!21290 () Bool)

(assert (=> b!35014 (=> (not res!21290) (not e!22135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2427 (_ BitVec 32)) Bool)

(assert (=> b!35014 (= res!21290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35015 () Bool)

(declare-fun e!22132 () Bool)

(declare-fun mapRes!1957 () Bool)

(assert (=> b!35015 (= e!22132 (and e!22133 mapRes!1957))))

(declare-fun condMapEmpty!1957 () Bool)

(declare-datatypes ((V!1967 0))(
  ( (V!1968 (val!830 Int)) )
))
(declare-datatypes ((ValueCell!604 0))(
  ( (ValueCellFull!604 (v!1925 V!1967)) (EmptyCell!604) )
))
(declare-datatypes ((array!2429 0))(
  ( (array!2430 (arr!1162 (Array (_ BitVec 32) ValueCell!604)) (size!1263 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2429)

(declare-fun mapDefault!1957 () ValueCell!604)

