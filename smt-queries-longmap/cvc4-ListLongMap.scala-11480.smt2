; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133682 () Bool)

(assert start!133682)

(declare-fun b!1562994 () Bool)

(declare-fun res!1068548 () Bool)

(declare-fun e!871076 () Bool)

(assert (=> b!1562994 (=> (not res!1068548) (not e!871076))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104232 0))(
  ( (array!104233 (arr!50308 (Array (_ BitVec 32) (_ BitVec 64))) (size!50858 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104232)

(declare-datatypes ((V!59893 0))(
  ( (V!59894 (val!19466 Int)) )
))
(declare-datatypes ((ValueCell!18352 0))(
  ( (ValueCellFull!18352 (v!22218 V!59893)) (EmptyCell!18352) )
))
(declare-datatypes ((array!104234 0))(
  ( (array!104235 (arr!50309 (Array (_ BitVec 32) ValueCell!18352)) (size!50859 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104234)

(assert (=> b!1562994 (= res!1068548 (and (= (size!50859 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50858 _keys!637) (size!50859 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562995 () Bool)

(declare-fun e!871077 () Bool)

(declare-fun e!871078 () Bool)

(declare-fun mapRes!59523 () Bool)

(assert (=> b!1562995 (= e!871077 (and e!871078 mapRes!59523))))

(declare-fun condMapEmpty!59523 () Bool)

(declare-fun mapDefault!59523 () ValueCell!18352)

