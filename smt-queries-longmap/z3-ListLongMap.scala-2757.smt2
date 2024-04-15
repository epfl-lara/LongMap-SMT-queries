; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40380 () Bool)

(assert start!40380)

(declare-fun b!443758 () Bool)

(declare-fun e!261009 () Bool)

(declare-fun e!261013 () Bool)

(declare-fun mapRes!19296 () Bool)

(assert (=> b!443758 (= e!261009 (and e!261013 mapRes!19296))))

(declare-fun condMapEmpty!19296 () Bool)

(declare-datatypes ((V!16811 0))(
  ( (V!16812 (val!5934 Int)) )
))
(declare-datatypes ((ValueCell!5546 0))(
  ( (ValueCellFull!5546 (v!8179 V!16811)) (EmptyCell!5546) )
))
(declare-datatypes ((array!27371 0))(
  ( (array!27372 (arr!13133 (Array (_ BitVec 32) ValueCell!5546)) (size!13486 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27371)

(declare-fun mapDefault!19296 () ValueCell!5546)

(assert (=> b!443758 (= condMapEmpty!19296 (= (arr!13133 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5546)) mapDefault!19296)))))

(declare-fun b!443759 () Bool)

(declare-fun e!261011 () Bool)

(declare-fun tp_is_empty!11779 () Bool)

(assert (=> b!443759 (= e!261011 tp_is_empty!11779)))

(declare-fun res!263096 () Bool)

(declare-fun e!261014 () Bool)

(assert (=> start!40380 (=> (not res!263096) (not e!261014))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27373 0))(
  ( (array!27374 (arr!13134 (Array (_ BitVec 32) (_ BitVec 64))) (size!13487 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27373)

(assert (=> start!40380 (= res!263096 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13487 _keys!709))))))

(assert (=> start!40380 e!261014))

(assert (=> start!40380 true))

(declare-fun array_inv!9574 (array!27371) Bool)

(assert (=> start!40380 (and (array_inv!9574 _values!549) e!261009)))

(declare-fun array_inv!9575 (array!27373) Bool)

(assert (=> start!40380 (array_inv!9575 _keys!709)))

(declare-fun b!443760 () Bool)

(declare-fun res!263099 () Bool)

(assert (=> b!443760 (=> (not res!263099) (not e!261014))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443760 (= res!263099 (validKeyInArray!0 k0!794))))

(declare-fun b!443761 () Bool)

(declare-fun e!261012 () Bool)

(assert (=> b!443761 (= e!261012 false)))

(declare-fun lt!203194 () Bool)

(declare-fun lt!203195 () array!27373)

(declare-datatypes ((List!7867 0))(
  ( (Nil!7864) (Cons!7863 (h!8719 (_ BitVec 64)) (t!13616 List!7867)) )
))
(declare-fun arrayNoDuplicates!0 (array!27373 (_ BitVec 32) List!7867) Bool)

(assert (=> b!443761 (= lt!203194 (arrayNoDuplicates!0 lt!203195 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun b!443762 () Bool)

(declare-fun res!263093 () Bool)

(assert (=> b!443762 (=> (not res!263093) (not e!261014))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443762 (= res!263093 (and (= (size!13486 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13487 _keys!709) (size!13486 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443763 () Bool)

(declare-fun res!263092 () Bool)

(assert (=> b!443763 (=> (not res!263092) (not e!261014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27373 (_ BitVec 32)) Bool)

(assert (=> b!443763 (= res!263092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443764 () Bool)

(declare-fun res!263094 () Bool)

(assert (=> b!443764 (=> (not res!263094) (not e!261014))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443764 (= res!263094 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13487 _keys!709))))))

(declare-fun b!443765 () Bool)

(declare-fun res!263095 () Bool)

(assert (=> b!443765 (=> (not res!263095) (not e!261014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443765 (= res!263095 (validMask!0 mask!1025))))

(declare-fun b!443766 () Bool)

(declare-fun res!263098 () Bool)

(assert (=> b!443766 (=> (not res!263098) (not e!261014))))

(assert (=> b!443766 (= res!263098 (or (= (select (arr!13134 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13134 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443767 () Bool)

(assert (=> b!443767 (= e!261013 tp_is_empty!11779)))

(declare-fun mapIsEmpty!19296 () Bool)

(assert (=> mapIsEmpty!19296 mapRes!19296))

(declare-fun b!443768 () Bool)

(declare-fun res!263101 () Bool)

(assert (=> b!443768 (=> (not res!263101) (not e!261014))))

(assert (=> b!443768 (= res!263101 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun b!443769 () Bool)

(declare-fun res!263097 () Bool)

(assert (=> b!443769 (=> (not res!263097) (not e!261014))))

(declare-fun arrayContainsKey!0 (array!27373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443769 (= res!263097 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443770 () Bool)

(assert (=> b!443770 (= e!261014 e!261012)))

(declare-fun res!263100 () Bool)

(assert (=> b!443770 (=> (not res!263100) (not e!261012))))

(assert (=> b!443770 (= res!263100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203195 mask!1025))))

(assert (=> b!443770 (= lt!203195 (array!27374 (store (arr!13134 _keys!709) i!563 k0!794) (size!13487 _keys!709)))))

(declare-fun mapNonEmpty!19296 () Bool)

(declare-fun tp!37278 () Bool)

(assert (=> mapNonEmpty!19296 (= mapRes!19296 (and tp!37278 e!261011))))

(declare-fun mapValue!19296 () ValueCell!5546)

(declare-fun mapKey!19296 () (_ BitVec 32))

(declare-fun mapRest!19296 () (Array (_ BitVec 32) ValueCell!5546))

(assert (=> mapNonEmpty!19296 (= (arr!13133 _values!549) (store mapRest!19296 mapKey!19296 mapValue!19296))))

(assert (= (and start!40380 res!263096) b!443765))

(assert (= (and b!443765 res!263095) b!443762))

(assert (= (and b!443762 res!263093) b!443763))

(assert (= (and b!443763 res!263092) b!443768))

(assert (= (and b!443768 res!263101) b!443764))

(assert (= (and b!443764 res!263094) b!443760))

(assert (= (and b!443760 res!263099) b!443766))

(assert (= (and b!443766 res!263098) b!443769))

(assert (= (and b!443769 res!263097) b!443770))

(assert (= (and b!443770 res!263100) b!443761))

(assert (= (and b!443758 condMapEmpty!19296) mapIsEmpty!19296))

(assert (= (and b!443758 (not condMapEmpty!19296)) mapNonEmpty!19296))

(get-info :version)

(assert (= (and mapNonEmpty!19296 ((_ is ValueCellFull!5546) mapValue!19296)) b!443759))

(assert (= (and b!443758 ((_ is ValueCellFull!5546) mapDefault!19296)) b!443767))

(assert (= start!40380 b!443758))

(declare-fun m!429337 () Bool)

(assert (=> start!40380 m!429337))

(declare-fun m!429339 () Bool)

(assert (=> start!40380 m!429339))

(declare-fun m!429341 () Bool)

(assert (=> b!443765 m!429341))

(declare-fun m!429343 () Bool)

(assert (=> b!443770 m!429343))

(declare-fun m!429345 () Bool)

(assert (=> b!443770 m!429345))

(declare-fun m!429347 () Bool)

(assert (=> b!443763 m!429347))

(declare-fun m!429349 () Bool)

(assert (=> b!443769 m!429349))

(declare-fun m!429351 () Bool)

(assert (=> b!443768 m!429351))

(declare-fun m!429353 () Bool)

(assert (=> mapNonEmpty!19296 m!429353))

(declare-fun m!429355 () Bool)

(assert (=> b!443760 m!429355))

(declare-fun m!429357 () Bool)

(assert (=> b!443766 m!429357))

(declare-fun m!429359 () Bool)

(assert (=> b!443761 m!429359))

(check-sat (not b!443769) (not b!443760) (not b!443770) tp_is_empty!11779 (not mapNonEmpty!19296) (not b!443768) (not b!443765) (not start!40380) (not b!443761) (not b!443763))
(check-sat)
