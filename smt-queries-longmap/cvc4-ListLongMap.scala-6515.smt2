; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82934 () Bool)

(assert start!82934)

(declare-fun b_free!19061 () Bool)

(declare-fun b_next!19061 () Bool)

(assert (=> start!82934 (= b_free!19061 (not b_next!19061))))

(declare-fun tp!66311 () Bool)

(declare-fun b_and!30549 () Bool)

(assert (=> start!82934 (= tp!66311 b_and!30549)))

(declare-fun b!967845 () Bool)

(declare-fun res!647912 () Bool)

(declare-fun e!545471 () Bool)

(assert (=> b!967845 (=> (not res!647912) (not e!545471))))

(declare-datatypes ((array!59811 0))(
  ( (array!59812 (arr!28774 (Array (_ BitVec 32) (_ BitVec 64))) (size!29253 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59811)

(declare-datatypes ((List!19977 0))(
  ( (Nil!19974) (Cons!19973 (h!21135 (_ BitVec 64)) (t!28340 List!19977)) )
))
(declare-fun arrayNoDuplicates!0 (array!59811 (_ BitVec 32) List!19977) Bool)

(assert (=> b!967845 (= res!647912 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19974))))

(declare-fun b!967846 () Bool)

(declare-fun res!647907 () Bool)

(assert (=> b!967846 (=> (not res!647907) (not e!545471))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967846 (= res!647907 (validKeyInArray!0 (select (arr!28774 _keys!1686) i!803)))))

(declare-fun b!967847 () Bool)

(declare-fun res!647911 () Bool)

(assert (=> b!967847 (=> (not res!647911) (not e!545471))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967847 (= res!647911 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34798 () Bool)

(declare-fun mapRes!34798 () Bool)

(assert (=> mapIsEmpty!34798 mapRes!34798))

(declare-fun b!967848 () Bool)

(declare-fun e!545470 () Bool)

(declare-fun e!545469 () Bool)

(assert (=> b!967848 (= e!545470 (and e!545469 mapRes!34798))))

(declare-fun condMapEmpty!34798 () Bool)

(declare-datatypes ((V!34141 0))(
  ( (V!34142 (val!10985 Int)) )
))
(declare-datatypes ((ValueCell!10453 0))(
  ( (ValueCellFull!10453 (v!13543 V!34141)) (EmptyCell!10453) )
))
(declare-datatypes ((array!59813 0))(
  ( (array!59814 (arr!28775 (Array (_ BitVec 32) ValueCell!10453)) (size!29254 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59813)

(declare-fun mapDefault!34798 () ValueCell!10453)

