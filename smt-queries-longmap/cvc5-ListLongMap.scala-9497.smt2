; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112590 () Bool)

(assert start!112590)

(declare-fun b_free!30985 () Bool)

(declare-fun b_next!30985 () Bool)

(assert (=> start!112590 (= b_free!30985 (not b_next!30985))))

(declare-fun tp!108592 () Bool)

(declare-fun b_and!49893 () Bool)

(assert (=> start!112590 (= tp!108592 b_and!49893)))

(declare-fun mapNonEmpty!57016 () Bool)

(declare-fun mapRes!57016 () Bool)

(declare-fun tp!108591 () Bool)

(declare-fun e!760671 () Bool)

(assert (=> mapNonEmpty!57016 (= mapRes!57016 (and tp!108591 e!760671))))

(declare-datatypes ((V!54297 0))(
  ( (V!54298 (val!18522 Int)) )
))
(declare-datatypes ((ValueCell!17549 0))(
  ( (ValueCellFull!17549 (v!21159 V!54297)) (EmptyCell!17549) )
))
(declare-fun mapRest!57016 () (Array (_ BitVec 32) ValueCell!17549))

(declare-datatypes ((array!90648 0))(
  ( (array!90649 (arr!43790 (Array (_ BitVec 32) ValueCell!17549)) (size!44340 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90648)

(declare-fun mapValue!57016 () ValueCell!17549)

(declare-fun mapKey!57016 () (_ BitVec 32))

(assert (=> mapNonEmpty!57016 (= (arr!43790 _values!1320) (store mapRest!57016 mapKey!57016 mapValue!57016))))

(declare-fun b!1335641 () Bool)

(declare-fun res!886455 () Bool)

(declare-fun e!760672 () Bool)

(assert (=> b!1335641 (=> (not res!886455) (not e!760672))))

(declare-datatypes ((array!90650 0))(
  ( (array!90651 (arr!43791 (Array (_ BitVec 32) (_ BitVec 64))) (size!44341 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90650)

(declare-datatypes ((List!31027 0))(
  ( (Nil!31024) (Cons!31023 (h!32232 (_ BitVec 64)) (t!45293 List!31027)) )
))
(declare-fun arrayNoDuplicates!0 (array!90650 (_ BitVec 32) List!31027) Bool)

(assert (=> b!1335641 (= res!886455 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31024))))

(declare-fun b!1335642 () Bool)

(declare-fun res!886453 () Bool)

(assert (=> b!1335642 (=> (not res!886453) (not e!760672))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90650 (_ BitVec 32)) Bool)

(assert (=> b!1335642 (= res!886453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335643 () Bool)

(declare-fun res!886458 () Bool)

(assert (=> b!1335643 (=> (not res!886458) (not e!760672))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335643 (= res!886458 (validKeyInArray!0 (select (arr!43791 _keys!1590) from!1980)))))

(declare-fun b!1335644 () Bool)

(declare-fun e!760669 () Bool)

(declare-fun e!760670 () Bool)

(assert (=> b!1335644 (= e!760669 (and e!760670 mapRes!57016))))

(declare-fun condMapEmpty!57016 () Bool)

(declare-fun mapDefault!57016 () ValueCell!17549)

