; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113016 () Bool)

(assert start!113016)

(declare-fun b!1339525 () Bool)

(declare-fun e!762980 () Bool)

(declare-fun tp_is_empty!37067 () Bool)

(assert (=> b!1339525 (= e!762980 tp_is_empty!37067)))

(declare-fun res!888606 () Bool)

(declare-fun e!762979 () Bool)

(assert (=> start!113016 (=> (not res!888606) (not e!762979))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113016 (= res!888606 (validMask!0 mask!1977))))

(assert (=> start!113016 e!762979))

(assert (=> start!113016 true))

(declare-datatypes ((array!90990 0))(
  ( (array!90991 (arr!43951 (Array (_ BitVec 32) (_ BitVec 64))) (size!44501 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90990)

(declare-fun array_inv!33141 (array!90990) Bool)

(assert (=> start!113016 (array_inv!33141 _keys!1571)))

(declare-datatypes ((V!54525 0))(
  ( (V!54526 (val!18608 Int)) )
))
(declare-datatypes ((ValueCell!17635 0))(
  ( (ValueCellFull!17635 (v!21256 V!54525)) (EmptyCell!17635) )
))
(declare-datatypes ((array!90992 0))(
  ( (array!90993 (arr!43952 (Array (_ BitVec 32) ValueCell!17635)) (size!44502 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90992)

(declare-fun e!762982 () Bool)

(declare-fun array_inv!33142 (array!90992) Bool)

(assert (=> start!113016 (and (array_inv!33142 _values!1303) e!762982)))

(declare-fun mapNonEmpty!57307 () Bool)

(declare-fun mapRes!57307 () Bool)

(declare-fun tp!109006 () Bool)

(assert (=> mapNonEmpty!57307 (= mapRes!57307 (and tp!109006 e!762980))))

(declare-fun mapKey!57307 () (_ BitVec 32))

(declare-fun mapRest!57307 () (Array (_ BitVec 32) ValueCell!17635))

(declare-fun mapValue!57307 () ValueCell!17635)

(assert (=> mapNonEmpty!57307 (= (arr!43952 _values!1303) (store mapRest!57307 mapKey!57307 mapValue!57307))))

(declare-fun b!1339526 () Bool)

(declare-fun e!762983 () Bool)

(assert (=> b!1339526 (= e!762983 tp_is_empty!37067)))

(declare-fun b!1339527 () Bool)

(declare-fun res!888603 () Bool)

(assert (=> b!1339527 (=> (not res!888603) (not e!762979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90990 (_ BitVec 32)) Bool)

(assert (=> b!1339527 (= res!888603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339528 () Bool)

(declare-fun res!888604 () Bool)

(assert (=> b!1339528 (=> (not res!888604) (not e!762979))))

(declare-datatypes ((List!31112 0))(
  ( (Nil!31109) (Cons!31108 (h!32317 (_ BitVec 64)) (t!45444 List!31112)) )
))
(declare-fun arrayNoDuplicates!0 (array!90990 (_ BitVec 32) List!31112) Bool)

(assert (=> b!1339528 (= res!888604 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31109))))

(declare-fun b!1339529 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1339529 (= e!762979 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44501 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1960 (size!44501 _keys!1571))))))

(declare-fun b!1339530 () Bool)

(declare-fun res!888605 () Bool)

(assert (=> b!1339530 (=> (not res!888605) (not e!762979))))

(assert (=> b!1339530 (= res!888605 (and (= (size!44502 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44501 _keys!1571) (size!44502 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339531 () Bool)

(assert (=> b!1339531 (= e!762982 (and e!762983 mapRes!57307))))

(declare-fun condMapEmpty!57307 () Bool)

(declare-fun mapDefault!57307 () ValueCell!17635)

