; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82960 () Bool)

(assert start!82960)

(declare-fun b_free!19087 () Bool)

(declare-fun b_next!19087 () Bool)

(assert (=> start!82960 (= b_free!19087 (not b_next!19087))))

(declare-fun tp!66389 () Bool)

(declare-fun b_and!30575 () Bool)

(assert (=> start!82960 (= tp!66389 b_and!30575)))

(declare-fun b!968292 () Bool)

(declare-fun e!545683 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968292 (= e!545683 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34177 0))(
  ( (V!34178 (val!10998 Int)) )
))
(declare-datatypes ((ValueCell!10466 0))(
  ( (ValueCellFull!10466 (v!13556 V!34177)) (EmptyCell!10466) )
))
(declare-datatypes ((array!59861 0))(
  ( (array!59862 (arr!28799 (Array (_ BitVec 32) ValueCell!10466)) (size!29278 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59861)

(declare-datatypes ((array!59863 0))(
  ( (array!59864 (arr!28800 (Array (_ BitVec 32) (_ BitVec 64))) (size!29279 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59863)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34177)

(declare-datatypes ((tuple2!14152 0))(
  ( (tuple2!14153 (_1!7087 (_ BitVec 64)) (_2!7087 V!34177)) )
))
(declare-datatypes ((List!19998 0))(
  ( (Nil!19995) (Cons!19994 (h!21156 tuple2!14152) (t!28361 List!19998)) )
))
(declare-datatypes ((ListLongMap!12849 0))(
  ( (ListLongMap!12850 (toList!6440 List!19998)) )
))
(declare-fun lt!431515 () ListLongMap!12849)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!34177)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun getCurrentListMap!3673 (array!59863 array!59861 (_ BitVec 32) (_ BitVec 32) V!34177 V!34177 (_ BitVec 32) Int) ListLongMap!12849)

(assert (=> b!968292 (= lt!431515 (getCurrentListMap!3673 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403))))

(declare-fun b!968293 () Bool)

(declare-fun res!648238 () Bool)

(assert (=> b!968293 (=> (not res!648238) (not e!545683))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun contains!5541 (ListLongMap!12849 (_ BitVec 64)) Bool)

(assert (=> b!968293 (= res!648238 (contains!5541 (getCurrentListMap!3673 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28800 _keys!1686) i!803)))))

(declare-fun b!968294 () Bool)

(declare-fun e!545682 () Bool)

(declare-fun e!545684 () Bool)

(declare-fun mapRes!34837 () Bool)

(assert (=> b!968294 (= e!545682 (and e!545684 mapRes!34837))))

(declare-fun condMapEmpty!34837 () Bool)

(declare-fun mapDefault!34837 () ValueCell!10466)

