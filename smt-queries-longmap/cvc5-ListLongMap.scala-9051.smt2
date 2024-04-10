; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109090 () Bool)

(assert start!109090)

(declare-fun b_free!28579 () Bool)

(declare-fun b_next!28579 () Bool)

(assert (=> start!109090 (= b_free!28579 (not b_next!28579))))

(declare-fun tp!100856 () Bool)

(declare-fun b_and!46669 () Bool)

(assert (=> start!109090 (= tp!100856 b_and!46669)))

(declare-fun b!1289705 () Bool)

(declare-fun res!856719 () Bool)

(declare-fun e!736349 () Bool)

(assert (=> b!1289705 (=> (not res!856719) (not e!736349))))

(declare-datatypes ((array!85480 0))(
  ( (array!85481 (arr!41241 (Array (_ BitVec 32) (_ BitVec 64))) (size!41791 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85480)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85480 (_ BitVec 32)) Bool)

(assert (=> b!1289705 (= res!856719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289706 () Bool)

(declare-fun res!856720 () Bool)

(assert (=> b!1289706 (=> (not res!856720) (not e!736349))))

(declare-datatypes ((List!29242 0))(
  ( (Nil!29239) (Cons!29238 (h!30447 (_ BitVec 64)) (t!42806 List!29242)) )
))
(declare-fun arrayNoDuplicates!0 (array!85480 (_ BitVec 32) List!29242) Bool)

(assert (=> b!1289706 (= res!856720 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29239))))

(declare-fun b!1289707 () Bool)

(declare-fun e!736347 () Bool)

(declare-fun e!736352 () Bool)

(declare-fun mapRes!52889 () Bool)

(assert (=> b!1289707 (= e!736347 (and e!736352 mapRes!52889))))

(declare-fun condMapEmpty!52889 () Bool)

(declare-datatypes ((V!50729 0))(
  ( (V!50730 (val!17184 Int)) )
))
(declare-datatypes ((ValueCell!16211 0))(
  ( (ValueCellFull!16211 (v!19787 V!50729)) (EmptyCell!16211) )
))
(declare-datatypes ((array!85482 0))(
  ( (array!85483 (arr!41242 (Array (_ BitVec 32) ValueCell!16211)) (size!41792 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85482)

(declare-fun mapDefault!52889 () ValueCell!16211)

