; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113264 () Bool)

(assert start!113264)

(declare-fun b_free!31315 () Bool)

(declare-fun b_next!31315 () Bool)

(assert (=> start!113264 (= b_free!31315 (not b_next!31315))))

(declare-fun tp!109749 () Bool)

(declare-fun b_and!50537 () Bool)

(assert (=> start!113264 (= tp!109749 b_and!50537)))

(declare-fun b!1343871 () Bool)

(declare-fun res!891642 () Bool)

(declare-fun e!764839 () Bool)

(assert (=> b!1343871 (=> (not res!891642) (not e!764839))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91474 0))(
  ( (array!91475 (arr!44193 (Array (_ BitVec 32) (_ BitVec 64))) (size!44743 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91474)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54857 0))(
  ( (V!54858 (val!18732 Int)) )
))
(declare-datatypes ((ValueCell!17759 0))(
  ( (ValueCellFull!17759 (v!21380 V!54857)) (EmptyCell!17759) )
))
(declare-datatypes ((array!91476 0))(
  ( (array!91477 (arr!44194 (Array (_ BitVec 32) ValueCell!17759)) (size!44744 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91476)

(assert (=> b!1343871 (= res!891642 (and (= (size!44744 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44743 _keys!1571) (size!44744 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343872 () Bool)

(declare-fun res!891644 () Bool)

(assert (=> b!1343872 (=> (not res!891644) (not e!764839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91474 (_ BitVec 32)) Bool)

(assert (=> b!1343872 (= res!891644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343873 () Bool)

(declare-fun res!891641 () Bool)

(assert (=> b!1343873 (=> (not res!891641) (not e!764839))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343873 (= res!891641 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44743 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57679 () Bool)

(declare-fun mapRes!57679 () Bool)

(declare-fun tp!109750 () Bool)

(declare-fun e!764842 () Bool)

(assert (=> mapNonEmpty!57679 (= mapRes!57679 (and tp!109750 e!764842))))

(declare-fun mapRest!57679 () (Array (_ BitVec 32) ValueCell!17759))

(declare-fun mapKey!57679 () (_ BitVec 32))

(declare-fun mapValue!57679 () ValueCell!17759)

(assert (=> mapNonEmpty!57679 (= (arr!44194 _values!1303) (store mapRest!57679 mapKey!57679 mapValue!57679))))

(declare-fun res!891643 () Bool)

(assert (=> start!113264 (=> (not res!891643) (not e!764839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113264 (= res!891643 (validMask!0 mask!1977))))

(assert (=> start!113264 e!764839))

(declare-fun tp_is_empty!37315 () Bool)

(assert (=> start!113264 tp_is_empty!37315))

(assert (=> start!113264 true))

(declare-fun array_inv!33307 (array!91474) Bool)

(assert (=> start!113264 (array_inv!33307 _keys!1571)))

(declare-fun e!764843 () Bool)

(declare-fun array_inv!33308 (array!91476) Bool)

(assert (=> start!113264 (and (array_inv!33308 _values!1303) e!764843)))

(assert (=> start!113264 tp!109749))

(declare-fun b!1343874 () Bool)

(declare-fun e!764840 () Bool)

(assert (=> b!1343874 (= e!764840 tp_is_empty!37315)))

(declare-fun mapIsEmpty!57679 () Bool)

(assert (=> mapIsEmpty!57679 mapRes!57679))

(declare-fun b!1343875 () Bool)

(declare-fun res!891645 () Bool)

(assert (=> b!1343875 (=> (not res!891645) (not e!764839))))

(declare-datatypes ((List!31291 0))(
  ( (Nil!31288) (Cons!31287 (h!32496 (_ BitVec 64)) (t!45815 List!31291)) )
))
(declare-fun arrayNoDuplicates!0 (array!91474 (_ BitVec 32) List!31291) Bool)

(assert (=> b!1343875 (= res!891645 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31288))))

(declare-fun b!1343876 () Bool)

(assert (=> b!1343876 (= e!764843 (and e!764840 mapRes!57679))))

(declare-fun condMapEmpty!57679 () Bool)

(declare-fun mapDefault!57679 () ValueCell!17759)

