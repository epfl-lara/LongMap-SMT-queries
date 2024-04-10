; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82302 () Bool)

(assert start!82302)

(declare-fun b_free!18575 () Bool)

(declare-fun b_next!18575 () Bool)

(assert (=> start!82302 (= b_free!18575 (not b_next!18575))))

(declare-fun tp!64686 () Bool)

(declare-fun b_and!30063 () Bool)

(assert (=> start!82302 (= tp!64686 b_and!30063)))

(declare-fun b!959512 () Bool)

(declare-fun res!642284 () Bool)

(declare-fun e!540882 () Bool)

(assert (=> b!959512 (=> (not res!642284) (not e!540882))))

(declare-datatypes ((array!58655 0))(
  ( (array!58656 (arr!28201 (Array (_ BitVec 32) (_ BitVec 64))) (size!28680 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58655)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959512 (= res!642284 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28680 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28680 _keys!1668))))))

(declare-fun b!959513 () Bool)

(declare-fun res!642285 () Bool)

(assert (=> b!959513 (=> (not res!642285) (not e!540882))))

(declare-datatypes ((List!19612 0))(
  ( (Nil!19609) (Cons!19608 (h!20770 (_ BitVec 64)) (t!27975 List!19612)) )
))
(declare-fun arrayNoDuplicates!0 (array!58655 (_ BitVec 32) List!19612) Bool)

(assert (=> b!959513 (= res!642285 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19609))))

(declare-fun b!959514 () Bool)

(declare-fun res!642289 () Bool)

(assert (=> b!959514 (=> (not res!642289) (not e!540882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959514 (= res!642289 (validKeyInArray!0 (select (arr!28201 _keys!1668) i!793)))))

(declare-fun b!959515 () Bool)

(declare-fun e!540881 () Bool)

(declare-fun e!540885 () Bool)

(declare-fun mapRes!33901 () Bool)

(assert (=> b!959515 (= e!540881 (and e!540885 mapRes!33901))))

(declare-fun condMapEmpty!33901 () Bool)

(declare-datatypes ((V!33357 0))(
  ( (V!33358 (val!10691 Int)) )
))
(declare-datatypes ((ValueCell!10159 0))(
  ( (ValueCellFull!10159 (v!13248 V!33357)) (EmptyCell!10159) )
))
(declare-datatypes ((array!58657 0))(
  ( (array!58658 (arr!28202 (Array (_ BitVec 32) ValueCell!10159)) (size!28681 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58657)

(declare-fun mapDefault!33901 () ValueCell!10159)

