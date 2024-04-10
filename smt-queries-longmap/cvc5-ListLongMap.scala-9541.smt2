; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113108 () Bool)

(assert start!113108)

(declare-fun b_free!31159 () Bool)

(declare-fun b_next!31159 () Bool)

(assert (=> start!113108 (= b_free!31159 (not b_next!31159))))

(declare-fun tp!109282 () Bool)

(declare-fun b_and!50225 () Bool)

(assert (=> start!113108 (= tp!109282 b_and!50225)))

(declare-fun b!1340915 () Bool)

(declare-fun e!763670 () Bool)

(assert (=> b!1340915 (= e!763670 (not true))))

(declare-datatypes ((V!54649 0))(
  ( (V!54650 (val!18654 Int)) )
))
(declare-datatypes ((tuple2!24016 0))(
  ( (tuple2!24017 (_1!12019 (_ BitVec 64)) (_2!12019 V!54649)) )
))
(declare-datatypes ((List!31178 0))(
  ( (Nil!31175) (Cons!31174 (h!32383 tuple2!24016) (t!45548 List!31178)) )
))
(declare-datatypes ((ListLongMap!21673 0))(
  ( (ListLongMap!21674 (toList!10852 List!31178)) )
))
(declare-fun lt!594063 () ListLongMap!21673)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9028 (ListLongMap!21673 (_ BitVec 64)) Bool)

(assert (=> b!1340915 (contains!9028 lt!594063 k!1142)))

(declare-fun zeroValue!1245 () V!54649)

(declare-datatypes ((Unit!44009 0))(
  ( (Unit!44010) )
))
(declare-fun lt!594062 () Unit!44009)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!335 ((_ BitVec 64) (_ BitVec 64) V!54649 ListLongMap!21673) Unit!44009)

(assert (=> b!1340915 (= lt!594062 (lemmaInListMapAfterAddingDiffThenInBefore!335 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594063))))

(declare-fun minValue!1245 () V!54649)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91170 0))(
  ( (array!91171 (arr!44041 (Array (_ BitVec 32) (_ BitVec 64))) (size!44591 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91170)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17681 0))(
  ( (ValueCellFull!17681 (v!21302 V!54649)) (EmptyCell!17681) )
))
(declare-datatypes ((array!91172 0))(
  ( (array!91173 (arr!44042 (Array (_ BitVec 32) ValueCell!17681)) (size!44592 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91172)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4766 (ListLongMap!21673 tuple2!24016) ListLongMap!21673)

(declare-fun getCurrentListMapNoExtraKeys!6408 (array!91170 array!91172 (_ BitVec 32) (_ BitVec 32) V!54649 V!54649 (_ BitVec 32) Int) ListLongMap!21673)

(declare-fun get!22225 (ValueCell!17681 V!54649) V!54649)

(declare-fun dynLambda!3705 (Int (_ BitVec 64)) V!54649)

(assert (=> b!1340915 (= lt!594063 (+!4766 (getCurrentListMapNoExtraKeys!6408 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24017 (select (arr!44041 _keys!1571) from!1960) (get!22225 (select (arr!44042 _values!1303) from!1960) (dynLambda!3705 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340916 () Bool)

(declare-fun res!889547 () Bool)

(assert (=> b!1340916 (=> (not res!889547) (not e!763670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91170 (_ BitVec 32)) Bool)

(assert (=> b!1340916 (= res!889547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57445 () Bool)

(declare-fun mapRes!57445 () Bool)

(declare-fun tp!109281 () Bool)

(declare-fun e!763671 () Bool)

(assert (=> mapNonEmpty!57445 (= mapRes!57445 (and tp!109281 e!763671))))

(declare-fun mapValue!57445 () ValueCell!17681)

(declare-fun mapKey!57445 () (_ BitVec 32))

(declare-fun mapRest!57445 () (Array (_ BitVec 32) ValueCell!17681))

(assert (=> mapNonEmpty!57445 (= (arr!44042 _values!1303) (store mapRest!57445 mapKey!57445 mapValue!57445))))

(declare-fun b!1340917 () Bool)

(declare-fun res!889546 () Bool)

(assert (=> b!1340917 (=> (not res!889546) (not e!763670))))

(assert (=> b!1340917 (= res!889546 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340918 () Bool)

(declare-fun e!763673 () Bool)

(declare-fun tp_is_empty!37159 () Bool)

(assert (=> b!1340918 (= e!763673 tp_is_empty!37159)))

(declare-fun b!1340920 () Bool)

(assert (=> b!1340920 (= e!763671 tp_is_empty!37159)))

(declare-fun b!1340921 () Bool)

(declare-fun res!889550 () Bool)

(assert (=> b!1340921 (=> (not res!889550) (not e!763670))))

(declare-datatypes ((List!31179 0))(
  ( (Nil!31176) (Cons!31175 (h!32384 (_ BitVec 64)) (t!45549 List!31179)) )
))
(declare-fun arrayNoDuplicates!0 (array!91170 (_ BitVec 32) List!31179) Bool)

(assert (=> b!1340921 (= res!889550 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31176))))

(declare-fun b!1340922 () Bool)

(declare-fun res!889543 () Bool)

(assert (=> b!1340922 (=> (not res!889543) (not e!763670))))

(assert (=> b!1340922 (= res!889543 (not (= (select (arr!44041 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340923 () Bool)

(declare-fun res!889544 () Bool)

(assert (=> b!1340923 (=> (not res!889544) (not e!763670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340923 (= res!889544 (validKeyInArray!0 (select (arr!44041 _keys!1571) from!1960)))))

(declare-fun b!1340924 () Bool)

(declare-fun res!889551 () Bool)

(assert (=> b!1340924 (=> (not res!889551) (not e!763670))))

(assert (=> b!1340924 (= res!889551 (and (= (size!44592 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44591 _keys!1571) (size!44592 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57445 () Bool)

(assert (=> mapIsEmpty!57445 mapRes!57445))

(declare-fun b!1340925 () Bool)

(declare-fun e!763669 () Bool)

(assert (=> b!1340925 (= e!763669 (and e!763673 mapRes!57445))))

(declare-fun condMapEmpty!57445 () Bool)

(declare-fun mapDefault!57445 () ValueCell!17681)

