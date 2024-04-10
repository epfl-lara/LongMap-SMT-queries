; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84140 () Bool)

(assert start!84140)

(declare-fun b!983776 () Bool)

(declare-fun res!658279 () Bool)

(declare-fun e!554625 () Bool)

(assert (=> b!983776 (=> (not res!658279) (not e!554625))))

(declare-datatypes ((array!61869 0))(
  ( (array!61870 (arr!29792 (Array (_ BitVec 32) (_ BitVec 64))) (size!30271 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61869)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983776 (= res!658279 (validKeyInArray!0 (select (arr!29792 _keys!1544) from!1932)))))

(declare-fun b!983777 () Bool)

(declare-fun e!554622 () Bool)

(declare-fun e!554624 () Bool)

(declare-fun mapRes!36443 () Bool)

(assert (=> b!983777 (= e!554622 (and e!554624 mapRes!36443))))

(declare-fun condMapEmpty!36443 () Bool)

(declare-datatypes ((V!35573 0))(
  ( (V!35574 (val!11522 Int)) )
))
(declare-datatypes ((ValueCell!10990 0))(
  ( (ValueCellFull!10990 (v!14084 V!35573)) (EmptyCell!10990) )
))
(declare-datatypes ((array!61871 0))(
  ( (array!61872 (arr!29793 (Array (_ BitVec 32) ValueCell!10990)) (size!30272 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61871)

(declare-fun mapDefault!36443 () ValueCell!10990)

