; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110942 () Bool)

(assert start!110942)

(declare-fun b_free!29777 () Bool)

(declare-fun b_next!29777 () Bool)

(assert (=> start!110942 (= b_free!29777 (not b_next!29777))))

(declare-fun tp!104653 () Bool)

(declare-fun b_and!47985 () Bool)

(assert (=> start!110942 (= tp!104653 b_and!47985)))

(declare-fun b!1313462 () Bool)

(declare-fun res!872009 () Bool)

(declare-fun e!749189 () Bool)

(assert (=> b!1313462 (=> (not res!872009) (not e!749189))))

(declare-datatypes ((array!87992 0))(
  ( (array!87993 (arr!42476 (Array (_ BitVec 32) (_ BitVec 64))) (size!43026 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87992)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313462 (= res!872009 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43026 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313463 () Bool)

(declare-fun e!749191 () Bool)

(declare-fun tp_is_empty!35507 () Bool)

(assert (=> b!1313463 (= e!749191 tp_is_empty!35507)))

(declare-fun b!1313464 () Bool)

(declare-fun e!749192 () Bool)

(assert (=> b!1313464 (= e!749192 tp_is_empty!35507)))

(declare-fun res!872011 () Bool)

(assert (=> start!110942 (=> (not res!872011) (not e!749189))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110942 (= res!872011 (validMask!0 mask!2040))))

(assert (=> start!110942 e!749189))

(assert (=> start!110942 tp!104653))

(declare-fun array_inv!32085 (array!87992) Bool)

(assert (=> start!110942 (array_inv!32085 _keys!1628)))

(assert (=> start!110942 true))

(assert (=> start!110942 tp_is_empty!35507))

(declare-datatypes ((V!52445 0))(
  ( (V!52446 (val!17828 Int)) )
))
(declare-datatypes ((ValueCell!16855 0))(
  ( (ValueCellFull!16855 (v!20455 V!52445)) (EmptyCell!16855) )
))
(declare-datatypes ((array!87994 0))(
  ( (array!87995 (arr!42477 (Array (_ BitVec 32) ValueCell!16855)) (size!43027 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87994)

(declare-fun e!749190 () Bool)

(declare-fun array_inv!32086 (array!87994) Bool)

(assert (=> start!110942 (and (array_inv!32086 _values!1354) e!749190)))

(declare-fun mapIsEmpty!54889 () Bool)

(declare-fun mapRes!54889 () Bool)

(assert (=> mapIsEmpty!54889 mapRes!54889))

(declare-fun b!1313465 () Bool)

(assert (=> b!1313465 (= e!749189 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52445)

(declare-fun lt!585675 () Bool)

(declare-fun zeroValue!1296 () V!52445)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22986 0))(
  ( (tuple2!22987 (_1!11504 (_ BitVec 64)) (_2!11504 V!52445)) )
))
(declare-datatypes ((List!30122 0))(
  ( (Nil!30119) (Cons!30118 (h!31327 tuple2!22986) (t!43728 List!30122)) )
))
(declare-datatypes ((ListLongMap!20643 0))(
  ( (ListLongMap!20644 (toList!10337 List!30122)) )
))
(declare-fun contains!8487 (ListLongMap!20643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5350 (array!87992 array!87994 (_ BitVec 32) (_ BitVec 32) V!52445 V!52445 (_ BitVec 32) Int) ListLongMap!20643)

(assert (=> b!1313465 (= lt!585675 (contains!8487 (getCurrentListMap!5350 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313466 () Bool)

(declare-fun res!872012 () Bool)

(assert (=> b!1313466 (=> (not res!872012) (not e!749189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87992 (_ BitVec 32)) Bool)

(assert (=> b!1313466 (= res!872012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313467 () Bool)

(declare-fun res!872010 () Bool)

(assert (=> b!1313467 (=> (not res!872010) (not e!749189))))

(assert (=> b!1313467 (= res!872010 (and (= (size!43027 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43026 _keys!1628) (size!43027 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54889 () Bool)

(declare-fun tp!104652 () Bool)

(assert (=> mapNonEmpty!54889 (= mapRes!54889 (and tp!104652 e!749192))))

(declare-fun mapValue!54889 () ValueCell!16855)

(declare-fun mapRest!54889 () (Array (_ BitVec 32) ValueCell!16855))

(declare-fun mapKey!54889 () (_ BitVec 32))

(assert (=> mapNonEmpty!54889 (= (arr!42477 _values!1354) (store mapRest!54889 mapKey!54889 mapValue!54889))))

(declare-fun b!1313468 () Bool)

(declare-fun res!872013 () Bool)

(assert (=> b!1313468 (=> (not res!872013) (not e!749189))))

(declare-datatypes ((List!30123 0))(
  ( (Nil!30120) (Cons!30119 (h!31328 (_ BitVec 64)) (t!43729 List!30123)) )
))
(declare-fun arrayNoDuplicates!0 (array!87992 (_ BitVec 32) List!30123) Bool)

(assert (=> b!1313468 (= res!872013 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30120))))

(declare-fun b!1313469 () Bool)

(assert (=> b!1313469 (= e!749190 (and e!749191 mapRes!54889))))

(declare-fun condMapEmpty!54889 () Bool)

(declare-fun mapDefault!54889 () ValueCell!16855)

