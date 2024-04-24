; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134072 () Bool)

(assert start!134072)

(declare-fun res!1069308 () Bool)

(declare-fun e!872420 () Bool)

(assert (=> start!134072 (=> (not res!1069308) (not e!872420))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134072 (= res!1069308 (validMask!0 mask!947))))

(assert (=> start!134072 e!872420))

(assert (=> start!134072 true))

(declare-datatypes ((V!59865 0))(
  ( (V!59866 (val!19455 Int)) )
))
(declare-datatypes ((ValueCell!18341 0))(
  ( (ValueCellFull!18341 (v!22199 V!59865)) (EmptyCell!18341) )
))
(declare-datatypes ((array!104310 0))(
  ( (array!104311 (arr!50340 (Array (_ BitVec 32) ValueCell!18341)) (size!50891 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104310)

(declare-fun e!872422 () Bool)

(declare-fun array_inv!39373 (array!104310) Bool)

(assert (=> start!134072 (and (array_inv!39373 _values!487) e!872422)))

(declare-datatypes ((array!104312 0))(
  ( (array!104313 (arr!50341 (Array (_ BitVec 32) (_ BitVec 64))) (size!50892 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104312)

(declare-fun array_inv!39374 (array!104312) Bool)

(assert (=> start!134072 (array_inv!39374 _keys!637)))

(declare-fun b!1565232 () Bool)

(assert (=> b!1565232 (= e!872420 false)))

(declare-fun lt!672692 () Bool)

(declare-datatypes ((List!36531 0))(
  ( (Nil!36528) (Cons!36527 (h!37991 (_ BitVec 64)) (t!51370 List!36531)) )
))
(declare-fun arrayNoDuplicates!0 (array!104312 (_ BitVec 32) List!36531) Bool)

(assert (=> b!1565232 (= lt!672692 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36528))))

(declare-fun mapIsEmpty!59490 () Bool)

(declare-fun mapRes!59490 () Bool)

(assert (=> mapIsEmpty!59490 mapRes!59490))

(declare-fun b!1565233 () Bool)

(declare-fun e!872419 () Bool)

(declare-fun tp_is_empty!38743 () Bool)

(assert (=> b!1565233 (= e!872419 tp_is_empty!38743)))

(declare-fun b!1565234 () Bool)

(declare-fun e!872418 () Bool)

(assert (=> b!1565234 (= e!872418 tp_is_empty!38743)))

(declare-fun b!1565235 () Bool)

(assert (=> b!1565235 (= e!872422 (and e!872419 mapRes!59490))))

(declare-fun condMapEmpty!59490 () Bool)

(declare-fun mapDefault!59490 () ValueCell!18341)

(assert (=> b!1565235 (= condMapEmpty!59490 (= (arr!50340 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18341)) mapDefault!59490)))))

(declare-fun b!1565236 () Bool)

(declare-fun res!1069309 () Bool)

(assert (=> b!1565236 (=> (not res!1069309) (not e!872420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104312 (_ BitVec 32)) Bool)

(assert (=> b!1565236 (= res!1069309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59490 () Bool)

(declare-fun tp!113325 () Bool)

(assert (=> mapNonEmpty!59490 (= mapRes!59490 (and tp!113325 e!872418))))

(declare-fun mapRest!59490 () (Array (_ BitVec 32) ValueCell!18341))

(declare-fun mapKey!59490 () (_ BitVec 32))

(declare-fun mapValue!59490 () ValueCell!18341)

(assert (=> mapNonEmpty!59490 (= (arr!50340 _values!487) (store mapRest!59490 mapKey!59490 mapValue!59490))))

(declare-fun b!1565237 () Bool)

(declare-fun res!1069310 () Bool)

(assert (=> b!1565237 (=> (not res!1069310) (not e!872420))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565237 (= res!1069310 (and (= (size!50891 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50892 _keys!637) (size!50891 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!134072 res!1069308) b!1565237))

(assert (= (and b!1565237 res!1069310) b!1565236))

(assert (= (and b!1565236 res!1069309) b!1565232))

(assert (= (and b!1565235 condMapEmpty!59490) mapIsEmpty!59490))

(assert (= (and b!1565235 (not condMapEmpty!59490)) mapNonEmpty!59490))

(get-info :version)

(assert (= (and mapNonEmpty!59490 ((_ is ValueCellFull!18341) mapValue!59490)) b!1565234))

(assert (= (and b!1565235 ((_ is ValueCellFull!18341) mapDefault!59490)) b!1565233))

(assert (= start!134072 b!1565235))

(declare-fun m!1440783 () Bool)

(assert (=> start!134072 m!1440783))

(declare-fun m!1440785 () Bool)

(assert (=> start!134072 m!1440785))

(declare-fun m!1440787 () Bool)

(assert (=> start!134072 m!1440787))

(declare-fun m!1440789 () Bool)

(assert (=> b!1565232 m!1440789))

(declare-fun m!1440791 () Bool)

(assert (=> b!1565236 m!1440791))

(declare-fun m!1440793 () Bool)

(assert (=> mapNonEmpty!59490 m!1440793))

(check-sat (not b!1565236) tp_is_empty!38743 (not b!1565232) (not mapNonEmpty!59490) (not start!134072))
(check-sat)
