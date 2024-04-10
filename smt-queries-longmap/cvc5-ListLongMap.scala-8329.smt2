; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101374 () Bool)

(assert start!101374)

(declare-fun b_free!26245 () Bool)

(declare-fun b_next!26245 () Bool)

(assert (=> start!101374 (= b_free!26245 (not b_next!26245))))

(declare-fun tp!91762 () Bool)

(declare-fun b_and!43643 () Bool)

(assert (=> start!101374 (= tp!91762 b_and!43643)))

(declare-fun b!1218167 () Bool)

(declare-fun res!809018 () Bool)

(declare-fun e!691619 () Bool)

(assert (=> b!1218167 (=> (not res!809018) (not e!691619))))

(declare-datatypes ((array!78673 0))(
  ( (array!78674 (arr!37969 (Array (_ BitVec 32) (_ BitVec 64))) (size!38505 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78673 (_ BitVec 32)) Bool)

(assert (=> b!1218167 (= res!809018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218168 () Bool)

(declare-fun e!691611 () Bool)

(assert (=> b!1218168 (= e!691619 e!691611)))

(declare-fun res!809009 () Bool)

(assert (=> b!1218168 (=> (not res!809009) (not e!691611))))

(declare-fun lt!553743 () array!78673)

(assert (=> b!1218168 (= res!809009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553743 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218168 (= lt!553743 (array!78674 (store (arr!37969 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38505 _keys!1208)))))

(declare-fun b!1218169 () Bool)

(declare-fun res!809014 () Bool)

(assert (=> b!1218169 (=> (not res!809014) (not e!691619))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1218169 (= res!809014 (= (select (arr!37969 _keys!1208) i!673) k!934))))

(declare-fun b!1218170 () Bool)

(declare-fun e!691614 () Bool)

(declare-fun arrayContainsKey!0 (array!78673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218170 (= e!691614 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!48304 () Bool)

(declare-fun mapRes!48304 () Bool)

(assert (=> mapIsEmpty!48304 mapRes!48304))

(declare-fun b!1218171 () Bool)

(declare-fun e!691616 () Bool)

(declare-fun e!691615 () Bool)

(assert (=> b!1218171 (= e!691616 (and e!691615 mapRes!48304))))

(declare-fun condMapEmpty!48304 () Bool)

(declare-datatypes ((V!46393 0))(
  ( (V!46394 (val!15531 Int)) )
))
(declare-datatypes ((ValueCell!14765 0))(
  ( (ValueCellFull!14765 (v!18186 V!46393)) (EmptyCell!14765) )
))
(declare-datatypes ((array!78675 0))(
  ( (array!78676 (arr!37970 (Array (_ BitVec 32) ValueCell!14765)) (size!38506 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78675)

(declare-fun mapDefault!48304 () ValueCell!14765)

