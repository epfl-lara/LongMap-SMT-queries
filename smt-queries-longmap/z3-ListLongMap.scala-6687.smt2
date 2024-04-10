; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84096 () Bool)

(assert start!84096)

(declare-fun b!983356 () Bool)

(declare-fun res!658055 () Bool)

(declare-fun e!554291 () Bool)

(assert (=> b!983356 (=> (not res!658055) (not e!554291))))

(declare-datatypes ((array!61787 0))(
  ( (array!61788 (arr!29751 (Array (_ BitVec 32) (_ BitVec 64))) (size!30230 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61787)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61787 (_ BitVec 32)) Bool)

(assert (=> b!983356 (= res!658055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36377 () Bool)

(declare-fun mapRes!36377 () Bool)

(declare-fun tp!69061 () Bool)

(declare-fun e!554293 () Bool)

(assert (=> mapNonEmpty!36377 (= mapRes!36377 (and tp!69061 e!554293))))

(declare-datatypes ((V!35515 0))(
  ( (V!35516 (val!11500 Int)) )
))
(declare-datatypes ((ValueCell!10968 0))(
  ( (ValueCellFull!10968 (v!14062 V!35515)) (EmptyCell!10968) )
))
(declare-fun mapRest!36377 () (Array (_ BitVec 32) ValueCell!10968))

(declare-datatypes ((array!61789 0))(
  ( (array!61790 (arr!29752 (Array (_ BitVec 32) ValueCell!10968)) (size!30231 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61789)

(declare-fun mapKey!36377 () (_ BitVec 32))

(declare-fun mapValue!36377 () ValueCell!10968)

(assert (=> mapNonEmpty!36377 (= (arr!29752 _values!1278) (store mapRest!36377 mapKey!36377 mapValue!36377))))

(declare-fun b!983357 () Bool)

(declare-fun res!658054 () Bool)

(assert (=> b!983357 (=> (not res!658054) (not e!554291))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983357 (= res!658054 (and (= (size!30231 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30230 _keys!1544) (size!30231 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983358 () Bool)

(declare-fun tp_is_empty!22899 () Bool)

(assert (=> b!983358 (= e!554293 tp_is_empty!22899)))

(declare-fun mapIsEmpty!36377 () Bool)

(assert (=> mapIsEmpty!36377 mapRes!36377))

(declare-fun b!983359 () Bool)

(assert (=> b!983359 (= e!554291 false)))

(declare-fun lt!436505 () Bool)

(declare-datatypes ((List!20609 0))(
  ( (Nil!20606) (Cons!20605 (h!21767 (_ BitVec 64)) (t!29400 List!20609)) )
))
(declare-fun arrayNoDuplicates!0 (array!61787 (_ BitVec 32) List!20609) Bool)

(assert (=> b!983359 (= lt!436505 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20606))))

(declare-fun res!658053 () Bool)

(assert (=> start!84096 (=> (not res!658053) (not e!554291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84096 (= res!658053 (validMask!0 mask!1948))))

(assert (=> start!84096 e!554291))

(assert (=> start!84096 true))

(declare-fun e!554292 () Bool)

(declare-fun array_inv!23003 (array!61789) Bool)

(assert (=> start!84096 (and (array_inv!23003 _values!1278) e!554292)))

(declare-fun array_inv!23004 (array!61787) Bool)

(assert (=> start!84096 (array_inv!23004 _keys!1544)))

(declare-fun b!983360 () Bool)

(declare-fun e!554295 () Bool)

(assert (=> b!983360 (= e!554292 (and e!554295 mapRes!36377))))

(declare-fun condMapEmpty!36377 () Bool)

(declare-fun mapDefault!36377 () ValueCell!10968)

(assert (=> b!983360 (= condMapEmpty!36377 (= (arr!29752 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10968)) mapDefault!36377)))))

(declare-fun b!983361 () Bool)

(assert (=> b!983361 (= e!554295 tp_is_empty!22899)))

(assert (= (and start!84096 res!658053) b!983357))

(assert (= (and b!983357 res!658054) b!983356))

(assert (= (and b!983356 res!658055) b!983359))

(assert (= (and b!983360 condMapEmpty!36377) mapIsEmpty!36377))

(assert (= (and b!983360 (not condMapEmpty!36377)) mapNonEmpty!36377))

(get-info :version)

(assert (= (and mapNonEmpty!36377 ((_ is ValueCellFull!10968) mapValue!36377)) b!983358))

(assert (= (and b!983360 ((_ is ValueCellFull!10968) mapDefault!36377)) b!983361))

(assert (= start!84096 b!983360))

(declare-fun m!910657 () Bool)

(assert (=> b!983356 m!910657))

(declare-fun m!910659 () Bool)

(assert (=> mapNonEmpty!36377 m!910659))

(declare-fun m!910661 () Bool)

(assert (=> b!983359 m!910661))

(declare-fun m!910663 () Bool)

(assert (=> start!84096 m!910663))

(declare-fun m!910665 () Bool)

(assert (=> start!84096 m!910665))

(declare-fun m!910667 () Bool)

(assert (=> start!84096 m!910667))

(check-sat (not b!983359) (not mapNonEmpty!36377) (not b!983356) tp_is_empty!22899 (not start!84096))
(check-sat)
