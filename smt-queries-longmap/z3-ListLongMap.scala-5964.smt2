; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77612 () Bool)

(assert start!77612)

(declare-fun b_free!16197 () Bool)

(declare-fun b_next!16197 () Bool)

(assert (=> start!77612 (= b_free!16197 (not b_next!16197))))

(declare-fun tp!56853 () Bool)

(declare-fun b_and!26563 () Bool)

(assert (=> start!77612 (= tp!56853 b_and!26563)))

(declare-fun b!904587 () Bool)

(declare-fun res!610368 () Bool)

(declare-fun e!506883 () Bool)

(assert (=> b!904587 (=> (not res!610368) (not e!506883))))

(declare-datatypes ((array!53274 0))(
  ( (array!53275 (arr!25596 (Array (_ BitVec 32) (_ BitVec 64))) (size!26055 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53274)

(declare-datatypes ((List!17975 0))(
  ( (Nil!17972) (Cons!17971 (h!19117 (_ BitVec 64)) (t!25358 List!17975)) )
))
(declare-fun arrayNoDuplicates!0 (array!53274 (_ BitVec 32) List!17975) Bool)

(assert (=> b!904587 (= res!610368 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17972))))

(declare-fun mapNonEmpty!29635 () Bool)

(declare-fun mapRes!29635 () Bool)

(declare-fun tp!56852 () Bool)

(declare-fun e!506884 () Bool)

(assert (=> mapNonEmpty!29635 (= mapRes!29635 (and tp!56852 e!506884))))

(declare-datatypes ((V!29785 0))(
  ( (V!29786 (val!9358 Int)) )
))
(declare-datatypes ((ValueCell!8826 0))(
  ( (ValueCellFull!8826 (v!11863 V!29785)) (EmptyCell!8826) )
))
(declare-datatypes ((array!53276 0))(
  ( (array!53277 (arr!25597 (Array (_ BitVec 32) ValueCell!8826)) (size!26056 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53276)

(declare-fun mapRest!29635 () (Array (_ BitVec 32) ValueCell!8826))

(declare-fun mapValue!29635 () ValueCell!8826)

(declare-fun mapKey!29635 () (_ BitVec 32))

(assert (=> mapNonEmpty!29635 (= (arr!25597 _values!1152) (store mapRest!29635 mapKey!29635 mapValue!29635))))

(declare-fun b!904588 () Bool)

(declare-fun e!506882 () Bool)

(assert (=> b!904588 (= e!506883 (not e!506882))))

(declare-fun res!610367 () Bool)

(assert (=> b!904588 (=> res!610367 e!506882)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904588 (= res!610367 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26055 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904588 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29785)

(declare-datatypes ((Unit!30682 0))(
  ( (Unit!30683) )
))
(declare-fun lt!408271 () Unit!30682)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29785)

(declare-fun lemmaKeyInListMapIsInArray!184 (array!53274 array!53276 (_ BitVec 32) (_ BitVec 32) V!29785 V!29785 (_ BitVec 64) Int) Unit!30682)

(assert (=> b!904588 (= lt!408271 (lemmaKeyInListMapIsInArray!184 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!610362 () Bool)

(assert (=> start!77612 (=> (not res!610362) (not e!506883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77612 (= res!610362 (validMask!0 mask!1756))))

(assert (=> start!77612 e!506883))

(declare-fun e!506886 () Bool)

(declare-fun array_inv!20052 (array!53276) Bool)

(assert (=> start!77612 (and (array_inv!20052 _values!1152) e!506886)))

(assert (=> start!77612 tp!56853))

(assert (=> start!77612 true))

(declare-fun tp_is_empty!18615 () Bool)

(assert (=> start!77612 tp_is_empty!18615))

(declare-fun array_inv!20053 (array!53274) Bool)

(assert (=> start!77612 (array_inv!20053 _keys!1386)))

(declare-fun b!904589 () Bool)

(declare-fun res!610363 () Bool)

(assert (=> b!904589 (=> (not res!610363) (not e!506883))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904589 (= res!610363 (inRange!0 i!717 mask!1756))))

(declare-fun b!904590 () Bool)

(declare-fun e!506880 () Bool)

(assert (=> b!904590 (= e!506886 (and e!506880 mapRes!29635))))

(declare-fun condMapEmpty!29635 () Bool)

(declare-fun mapDefault!29635 () ValueCell!8826)

(assert (=> b!904590 (= condMapEmpty!29635 (= (arr!25597 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8826)) mapDefault!29635)))))

(declare-fun mapIsEmpty!29635 () Bool)

(assert (=> mapIsEmpty!29635 mapRes!29635))

(declare-fun b!904591 () Bool)

(declare-fun res!610364 () Bool)

(assert (=> b!904591 (=> (not res!610364) (not e!506883))))

(declare-datatypes ((tuple2!12160 0))(
  ( (tuple2!12161 (_1!6091 (_ BitVec 64)) (_2!6091 V!29785)) )
))
(declare-datatypes ((List!17976 0))(
  ( (Nil!17973) (Cons!17972 (h!19118 tuple2!12160) (t!25359 List!17976)) )
))
(declare-datatypes ((ListLongMap!10857 0))(
  ( (ListLongMap!10858 (toList!5444 List!17976)) )
))
(declare-fun contains!4491 (ListLongMap!10857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2712 (array!53274 array!53276 (_ BitVec 32) (_ BitVec 32) V!29785 V!29785 (_ BitVec 32) Int) ListLongMap!10857)

(assert (=> b!904591 (= res!610364 (contains!4491 (getCurrentListMap!2712 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904592 () Bool)

(declare-fun res!610370 () Bool)

(assert (=> b!904592 (=> (not res!610370) (not e!506883))))

(assert (=> b!904592 (= res!610370 (and (= (size!26056 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26055 _keys!1386) (size!26056 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904593 () Bool)

(declare-fun e!506881 () Bool)

(assert (=> b!904593 (= e!506882 e!506881)))

(declare-fun res!610366 () Bool)

(assert (=> b!904593 (=> res!610366 e!506881)))

(declare-fun lt!408273 () ListLongMap!10857)

(assert (=> b!904593 (= res!610366 (not (contains!4491 lt!408273 k0!1033)))))

(assert (=> b!904593 (= lt!408273 (getCurrentListMap!2712 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904594 () Bool)

(assert (=> b!904594 (= e!506884 tp_is_empty!18615)))

(declare-fun b!904595 () Bool)

(declare-fun res!610369 () Bool)

(assert (=> b!904595 (=> (not res!610369) (not e!506883))))

(assert (=> b!904595 (= res!610369 (and (= (select (arr!25596 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904596 () Bool)

(assert (=> b!904596 (= e!506880 tp_is_empty!18615)))

(declare-fun b!904597 () Bool)

(declare-fun res!610365 () Bool)

(assert (=> b!904597 (=> (not res!610365) (not e!506883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53274 (_ BitVec 32)) Bool)

(assert (=> b!904597 (= res!610365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904598 () Bool)

(assert (=> b!904598 (= e!506881 true)))

(declare-fun lt!408272 () V!29785)

(declare-fun apply!438 (ListLongMap!10857 (_ BitVec 64)) V!29785)

(assert (=> b!904598 (= lt!408272 (apply!438 lt!408273 k0!1033))))

(assert (= (and start!77612 res!610362) b!904592))

(assert (= (and b!904592 res!610370) b!904597))

(assert (= (and b!904597 res!610365) b!904587))

(assert (= (and b!904587 res!610368) b!904591))

(assert (= (and b!904591 res!610364) b!904589))

(assert (= (and b!904589 res!610363) b!904595))

(assert (= (and b!904595 res!610369) b!904588))

(assert (= (and b!904588 (not res!610367)) b!904593))

(assert (= (and b!904593 (not res!610366)) b!904598))

(assert (= (and b!904590 condMapEmpty!29635) mapIsEmpty!29635))

(assert (= (and b!904590 (not condMapEmpty!29635)) mapNonEmpty!29635))

(get-info :version)

(assert (= (and mapNonEmpty!29635 ((_ is ValueCellFull!8826) mapValue!29635)) b!904594))

(assert (= (and b!904590 ((_ is ValueCellFull!8826) mapDefault!29635)) b!904596))

(assert (= start!77612 b!904590))

(declare-fun m!840055 () Bool)

(assert (=> b!904598 m!840055))

(declare-fun m!840057 () Bool)

(assert (=> start!77612 m!840057))

(declare-fun m!840059 () Bool)

(assert (=> start!77612 m!840059))

(declare-fun m!840061 () Bool)

(assert (=> start!77612 m!840061))

(declare-fun m!840063 () Bool)

(assert (=> mapNonEmpty!29635 m!840063))

(declare-fun m!840065 () Bool)

(assert (=> b!904587 m!840065))

(declare-fun m!840067 () Bool)

(assert (=> b!904593 m!840067))

(declare-fun m!840069 () Bool)

(assert (=> b!904593 m!840069))

(declare-fun m!840071 () Bool)

(assert (=> b!904591 m!840071))

(assert (=> b!904591 m!840071))

(declare-fun m!840073 () Bool)

(assert (=> b!904591 m!840073))

(declare-fun m!840075 () Bool)

(assert (=> b!904597 m!840075))

(declare-fun m!840077 () Bool)

(assert (=> b!904588 m!840077))

(declare-fun m!840079 () Bool)

(assert (=> b!904588 m!840079))

(declare-fun m!840081 () Bool)

(assert (=> b!904595 m!840081))

(declare-fun m!840083 () Bool)

(assert (=> b!904589 m!840083))

(check-sat (not b!904591) (not b!904588) (not b_next!16197) (not b!904589) tp_is_empty!18615 (not b!904587) (not b!904593) (not start!77612) (not b!904597) (not mapNonEmpty!29635) b_and!26563 (not b!904598))
(check-sat b_and!26563 (not b_next!16197))
