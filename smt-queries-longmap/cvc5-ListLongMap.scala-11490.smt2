; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133738 () Bool)

(assert start!133738)

(declare-fun b_free!32101 () Bool)

(declare-fun b_next!32101 () Bool)

(assert (=> start!133738 (= b_free!32101 (not b_next!32101))))

(declare-fun tp!113507 () Bool)

(declare-fun b_and!51671 () Bool)

(assert (=> start!133738 (= tp!113507 b_and!51671)))

(declare-fun res!1069088 () Bool)

(declare-fun e!871564 () Bool)

(assert (=> start!133738 (=> (not res!1069088) (not e!871564))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133738 (= res!1069088 (validMask!0 mask!947))))

(assert (=> start!133738 e!871564))

(assert (=> start!133738 tp!113507))

(declare-fun tp_is_empty!38821 () Bool)

(assert (=> start!133738 tp_is_empty!38821))

(assert (=> start!133738 true))

(declare-datatypes ((array!104334 0))(
  ( (array!104335 (arr!50359 (Array (_ BitVec 32) (_ BitVec 64))) (size!50909 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104334)

(declare-fun array_inv!39133 (array!104334) Bool)

(assert (=> start!133738 (array_inv!39133 _keys!637)))

(declare-datatypes ((V!59969 0))(
  ( (V!59970 (val!19494 Int)) )
))
(declare-datatypes ((ValueCell!18380 0))(
  ( (ValueCellFull!18380 (v!22246 V!59969)) (EmptyCell!18380) )
))
(declare-datatypes ((array!104336 0))(
  ( (array!104337 (arr!50360 (Array (_ BitVec 32) ValueCell!18380)) (size!50910 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104336)

(declare-fun e!871562 () Bool)

(declare-fun array_inv!39134 (array!104336) Bool)

(assert (=> start!133738 (and (array_inv!39134 _values!487) e!871562)))

(declare-fun b!1563785 () Bool)

(declare-fun res!1069089 () Bool)

(assert (=> b!1563785 (=> (not res!1069089) (not e!871564))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563785 (= res!1069089 (not (validKeyInArray!0 (select (arr!50359 _keys!637) from!782))))))

(declare-fun b!1563786 () Bool)

(declare-fun e!871559 () Bool)

(assert (=> b!1563786 (= e!871559 tp_is_empty!38821)))

(declare-fun b!1563787 () Bool)

(declare-fun res!1069086 () Bool)

(assert (=> b!1563787 (=> (not res!1069086) (not e!871564))))

(declare-datatypes ((List!36535 0))(
  ( (Nil!36532) (Cons!36531 (h!37977 (_ BitVec 64)) (t!51382 List!36535)) )
))
(declare-fun arrayNoDuplicates!0 (array!104334 (_ BitVec 32) List!36535) Bool)

(assert (=> b!1563787 (= res!1069086 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36532))))

(declare-fun b!1563788 () Bool)

(declare-fun res!1069090 () Bool)

(assert (=> b!1563788 (=> (not res!1069090) (not e!871564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104334 (_ BitVec 32)) Bool)

(assert (=> b!1563788 (= res!1069090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563789 () Bool)

(declare-fun e!871563 () Bool)

(assert (=> b!1563789 (= e!871563 tp_is_empty!38821)))

(declare-fun mapNonEmpty!59607 () Bool)

(declare-fun mapRes!59607 () Bool)

(declare-fun tp!113508 () Bool)

(assert (=> mapNonEmpty!59607 (= mapRes!59607 (and tp!113508 e!871563))))

(declare-fun mapKey!59607 () (_ BitVec 32))

(declare-fun mapValue!59607 () ValueCell!18380)

(declare-fun mapRest!59607 () (Array (_ BitVec 32) ValueCell!18380))

(assert (=> mapNonEmpty!59607 (= (arr!50360 _values!487) (store mapRest!59607 mapKey!59607 mapValue!59607))))

(declare-fun b!1563790 () Bool)

(assert (=> b!1563790 (= e!871562 (and e!871559 mapRes!59607))))

(declare-fun condMapEmpty!59607 () Bool)

(declare-fun mapDefault!59607 () ValueCell!18380)

