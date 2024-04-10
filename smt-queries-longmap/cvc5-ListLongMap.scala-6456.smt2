; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82576 () Bool)

(assert start!82576)

(declare-fun b_free!18709 () Bool)

(declare-fun b_next!18709 () Bool)

(assert (=> start!82576 (= b_free!18709 (not b_next!18709))))

(declare-fun tp!65246 () Bool)

(declare-fun b_and!30197 () Bool)

(assert (=> start!82576 (= tp!65246 b_and!30197)))

(declare-fun b!962358 () Bool)

(declare-fun res!644034 () Bool)

(declare-fun e!542703 () Bool)

(assert (=> b!962358 (=> (not res!644034) (not e!542703))))

(declare-datatypes ((array!59119 0))(
  ( (array!59120 (arr!28428 (Array (_ BitVec 32) (_ BitVec 64))) (size!28907 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59119)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59119 (_ BitVec 32)) Bool)

(assert (=> b!962358 (= res!644034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962359 () Bool)

(assert (=> b!962359 (= e!542703 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!430867 () Bool)

(declare-datatypes ((V!33665 0))(
  ( (V!33666 (val!10806 Int)) )
))
(declare-datatypes ((ValueCell!10274 0))(
  ( (ValueCellFull!10274 (v!13364 V!33665)) (EmptyCell!10274) )
))
(declare-datatypes ((array!59121 0))(
  ( (array!59122 (arr!28429 (Array (_ BitVec 32) ValueCell!10274)) (size!28908 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59121)

(declare-fun minValue!1342 () V!33665)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33665)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13878 0))(
  ( (tuple2!13879 (_1!6950 (_ BitVec 64)) (_2!6950 V!33665)) )
))
(declare-datatypes ((List!19729 0))(
  ( (Nil!19726) (Cons!19725 (h!20887 tuple2!13878) (t!28092 List!19729)) )
))
(declare-datatypes ((ListLongMap!12575 0))(
  ( (ListLongMap!12576 (toList!6303 List!19729)) )
))
(declare-fun contains!5406 (ListLongMap!12575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3536 (array!59119 array!59121 (_ BitVec 32) (_ BitVec 32) V!33665 V!33665 (_ BitVec 32) Int) ListLongMap!12575)

(assert (=> b!962359 (= lt!430867 (contains!5406 (getCurrentListMap!3536 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28428 _keys!1686) i!803)))))

(declare-fun b!962360 () Bool)

(declare-fun res!644035 () Bool)

(assert (=> b!962360 (=> (not res!644035) (not e!542703))))

(declare-datatypes ((List!19730 0))(
  ( (Nil!19727) (Cons!19726 (h!20888 (_ BitVec 64)) (t!28093 List!19730)) )
))
(declare-fun arrayNoDuplicates!0 (array!59119 (_ BitVec 32) List!19730) Bool)

(assert (=> b!962360 (= res!644035 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19727))))

(declare-fun b!962361 () Bool)

(declare-fun e!542705 () Bool)

(declare-fun tp_is_empty!21511 () Bool)

(assert (=> b!962361 (= e!542705 tp_is_empty!21511)))

(declare-fun b!962362 () Bool)

(declare-fun res!644030 () Bool)

(assert (=> b!962362 (=> (not res!644030) (not e!542703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962362 (= res!644030 (validKeyInArray!0 (select (arr!28428 _keys!1686) i!803)))))

(declare-fun b!962363 () Bool)

(declare-fun e!542704 () Bool)

(declare-fun mapRes!34261 () Bool)

(assert (=> b!962363 (= e!542704 (and e!542705 mapRes!34261))))

(declare-fun condMapEmpty!34261 () Bool)

(declare-fun mapDefault!34261 () ValueCell!10274)

