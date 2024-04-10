; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84404 () Bool)

(assert start!84404)

(declare-fun b_free!19975 () Bool)

(declare-fun b_next!19975 () Bool)

(assert (=> start!84404 (= b_free!19975 (not b_next!19975))))

(declare-fun tp!69702 () Bool)

(declare-fun b_and!32013 () Bool)

(assert (=> start!84404 (= tp!69702 b_and!32013)))

(declare-fun b!987214 () Bool)

(declare-fun res!660444 () Bool)

(declare-fun e!556696 () Bool)

(assert (=> b!987214 (=> (not res!660444) (not e!556696))))

(declare-datatypes ((array!62339 0))(
  ( (array!62340 (arr!30026 (Array (_ BitVec 32) (_ BitVec 64))) (size!30505 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62339)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62339 (_ BitVec 32)) Bool)

(assert (=> b!987214 (= res!660444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987215 () Bool)

(declare-fun res!660449 () Bool)

(assert (=> b!987215 (=> (not res!660449) (not e!556696))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987215 (= res!660449 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544))))))

(declare-fun b!987216 () Bool)

(declare-fun e!556698 () Bool)

(declare-fun e!556695 () Bool)

(declare-fun mapRes!36818 () Bool)

(assert (=> b!987216 (= e!556698 (and e!556695 mapRes!36818))))

(declare-fun condMapEmpty!36818 () Bool)

(declare-datatypes ((V!35905 0))(
  ( (V!35906 (val!11646 Int)) )
))
(declare-datatypes ((ValueCell!11114 0))(
  ( (ValueCellFull!11114 (v!14209 V!35905)) (EmptyCell!11114) )
))
(declare-datatypes ((array!62341 0))(
  ( (array!62342 (arr!30027 (Array (_ BitVec 32) ValueCell!11114)) (size!30506 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62341)

(declare-fun mapDefault!36818 () ValueCell!11114)

