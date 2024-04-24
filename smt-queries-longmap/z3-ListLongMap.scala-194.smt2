; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3780 () Bool)

(assert start!3780)

(declare-fun mapNonEmpty!1174 () Bool)

(declare-fun mapRes!1174 () Bool)

(declare-fun tp!3694 () Bool)

(declare-fun e!17182 () Bool)

(assert (=> mapNonEmpty!1174 (= mapRes!1174 (and tp!3694 e!17182))))

(declare-fun mapKey!1174 () (_ BitVec 32))

(declare-datatypes ((V!1299 0))(
  ( (V!1300 (val!579 Int)) )
))
(declare-datatypes ((ValueCell!353 0))(
  ( (ValueCellFull!353 (v!1665 V!1299)) (EmptyCell!353) )
))
(declare-fun mapRest!1174 () (Array (_ BitVec 32) ValueCell!353))

(declare-fun mapValue!1174 () ValueCell!353)

(declare-datatypes ((array!1429 0))(
  ( (array!1430 (arr!672 (Array (_ BitVec 32) ValueCell!353)) (size!773 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1429)

(assert (=> mapNonEmpty!1174 (= (arr!672 _values!1501) (store mapRest!1174 mapKey!1174 mapValue!1174))))

(declare-fun b!26378 () Bool)

(declare-fun res!15662 () Bool)

(declare-fun e!17181 () Bool)

(assert (=> b!26378 (=> (not res!15662) (not e!17181))))

(declare-datatypes ((array!1431 0))(
  ( (array!1432 (arr!673 (Array (_ BitVec 32) (_ BitVec 64))) (size!774 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1431)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1431 (_ BitVec 32)) Bool)

(assert (=> b!26378 (= res!15662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26379 () Bool)

(declare-fun res!15661 () Bool)

(assert (=> b!26379 (=> (not res!15661) (not e!17181))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26379 (= res!15661 (and (= (size!773 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!774 _keys!1833) (size!773 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26380 () Bool)

(declare-fun e!17180 () Bool)

(declare-fun tp_is_empty!1105 () Bool)

(assert (=> b!26380 (= e!17180 tp_is_empty!1105)))

(declare-fun mapIsEmpty!1174 () Bool)

(assert (=> mapIsEmpty!1174 mapRes!1174))

(declare-fun res!15660 () Bool)

(assert (=> start!3780 (=> (not res!15660) (not e!17181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3780 (= res!15660 (validMask!0 mask!2294))))

(assert (=> start!3780 e!17181))

(assert (=> start!3780 true))

(declare-fun e!17179 () Bool)

(declare-fun array_inv!469 (array!1429) Bool)

(assert (=> start!3780 (and (array_inv!469 _values!1501) e!17179)))

(declare-fun array_inv!470 (array!1431) Bool)

(assert (=> start!3780 (array_inv!470 _keys!1833)))

(declare-fun b!26381 () Bool)

(assert (=> b!26381 (= e!17181 false)))

(declare-fun lt!10323 () Bool)

(declare-datatypes ((List!583 0))(
  ( (Nil!580) (Cons!579 (h!1146 (_ BitVec 64)) (t!3264 List!583)) )
))
(declare-fun arrayNoDuplicates!0 (array!1431 (_ BitVec 32) List!583) Bool)

(assert (=> b!26381 (= lt!10323 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!580))))

(declare-fun b!26382 () Bool)

(assert (=> b!26382 (= e!17179 (and e!17180 mapRes!1174))))

(declare-fun condMapEmpty!1174 () Bool)

(declare-fun mapDefault!1174 () ValueCell!353)

(assert (=> b!26382 (= condMapEmpty!1174 (= (arr!672 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!353)) mapDefault!1174)))))

(declare-fun b!26383 () Bool)

(assert (=> b!26383 (= e!17182 tp_is_empty!1105)))

(assert (= (and start!3780 res!15660) b!26379))

(assert (= (and b!26379 res!15661) b!26378))

(assert (= (and b!26378 res!15662) b!26381))

(assert (= (and b!26382 condMapEmpty!1174) mapIsEmpty!1174))

(assert (= (and b!26382 (not condMapEmpty!1174)) mapNonEmpty!1174))

(get-info :version)

(assert (= (and mapNonEmpty!1174 ((_ is ValueCellFull!353) mapValue!1174)) b!26383))

(assert (= (and b!26382 ((_ is ValueCellFull!353) mapDefault!1174)) b!26380))

(assert (= start!3780 b!26382))

(declare-fun m!21069 () Bool)

(assert (=> mapNonEmpty!1174 m!21069))

(declare-fun m!21071 () Bool)

(assert (=> b!26378 m!21071))

(declare-fun m!21073 () Bool)

(assert (=> start!3780 m!21073))

(declare-fun m!21075 () Bool)

(assert (=> start!3780 m!21075))

(declare-fun m!21077 () Bool)

(assert (=> start!3780 m!21077))

(declare-fun m!21079 () Bool)

(assert (=> b!26381 m!21079))

(check-sat (not b!26378) (not b!26381) tp_is_empty!1105 (not mapNonEmpty!1174) (not start!3780))
(check-sat)
