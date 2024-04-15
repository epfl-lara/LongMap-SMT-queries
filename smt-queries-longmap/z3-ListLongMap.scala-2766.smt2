; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40434 () Bool)

(assert start!40434)

(declare-fun b!444811 () Bool)

(declare-fun res!263902 () Bool)

(declare-fun e!261500 () Bool)

(assert (=> b!444811 (=> (not res!263902) (not e!261500))))

(declare-datatypes ((array!27479 0))(
  ( (array!27480 (arr!13187 (Array (_ BitVec 32) (_ BitVec 64))) (size!13540 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27479)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27479 (_ BitVec 32)) Bool)

(assert (=> b!444811 (= res!263902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444812 () Bool)

(declare-fun e!261499 () Bool)

(assert (=> b!444812 (= e!261499 false)))

(declare-fun lt!203357 () Bool)

(declare-fun lt!203356 () array!27479)

(declare-datatypes ((List!7891 0))(
  ( (Nil!7888) (Cons!7887 (h!8743 (_ BitVec 64)) (t!13640 List!7891)) )
))
(declare-fun arrayNoDuplicates!0 (array!27479 (_ BitVec 32) List!7891) Bool)

(assert (=> b!444812 (= lt!203357 (arrayNoDuplicates!0 lt!203356 #b00000000000000000000000000000000 Nil!7888))))

(declare-fun mapNonEmpty!19377 () Bool)

(declare-fun mapRes!19377 () Bool)

(declare-fun tp!37359 () Bool)

(declare-fun e!261495 () Bool)

(assert (=> mapNonEmpty!19377 (= mapRes!19377 (and tp!37359 e!261495))))

(declare-datatypes ((V!16883 0))(
  ( (V!16884 (val!5961 Int)) )
))
(declare-datatypes ((ValueCell!5573 0))(
  ( (ValueCellFull!5573 (v!8206 V!16883)) (EmptyCell!5573) )
))
(declare-fun mapRest!19377 () (Array (_ BitVec 32) ValueCell!5573))

(declare-fun mapKey!19377 () (_ BitVec 32))

(declare-datatypes ((array!27481 0))(
  ( (array!27482 (arr!13188 (Array (_ BitVec 32) ValueCell!5573)) (size!13541 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27481)

(declare-fun mapValue!19377 () ValueCell!5573)

(assert (=> mapNonEmpty!19377 (= (arr!13188 _values!549) (store mapRest!19377 mapKey!19377 mapValue!19377))))

(declare-fun b!444813 () Bool)

(declare-fun res!263904 () Bool)

(assert (=> b!444813 (=> (not res!263904) (not e!261500))))

(assert (=> b!444813 (= res!263904 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7888))))

(declare-fun b!444815 () Bool)

(declare-fun e!261497 () Bool)

(declare-fun e!261496 () Bool)

(assert (=> b!444815 (= e!261497 (and e!261496 mapRes!19377))))

(declare-fun condMapEmpty!19377 () Bool)

(declare-fun mapDefault!19377 () ValueCell!5573)

(assert (=> b!444815 (= condMapEmpty!19377 (= (arr!13188 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5573)) mapDefault!19377)))))

(declare-fun b!444816 () Bool)

(declare-fun tp_is_empty!11833 () Bool)

(assert (=> b!444816 (= e!261496 tp_is_empty!11833)))

(declare-fun mapIsEmpty!19377 () Bool)

(assert (=> mapIsEmpty!19377 mapRes!19377))

(declare-fun b!444817 () Bool)

(assert (=> b!444817 (= e!261500 e!261499)))

(declare-fun res!263906 () Bool)

(assert (=> b!444817 (=> (not res!263906) (not e!261499))))

(assert (=> b!444817 (= res!263906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203356 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444817 (= lt!203356 (array!27480 (store (arr!13187 _keys!709) i!563 k0!794) (size!13540 _keys!709)))))

(declare-fun b!444818 () Bool)

(declare-fun res!263903 () Bool)

(assert (=> b!444818 (=> (not res!263903) (not e!261500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444818 (= res!263903 (validKeyInArray!0 k0!794))))

(declare-fun b!444819 () Bool)

(declare-fun res!263905 () Bool)

(assert (=> b!444819 (=> (not res!263905) (not e!261500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444819 (= res!263905 (validMask!0 mask!1025))))

(declare-fun b!444820 () Bool)

(assert (=> b!444820 (= e!261495 tp_is_empty!11833)))

(declare-fun b!444821 () Bool)

(declare-fun res!263911 () Bool)

(assert (=> b!444821 (=> (not res!263911) (not e!261500))))

(assert (=> b!444821 (= res!263911 (or (= (select (arr!13187 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13187 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444822 () Bool)

(declare-fun res!263908 () Bool)

(assert (=> b!444822 (=> (not res!263908) (not e!261500))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444822 (= res!263908 (and (= (size!13541 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13540 _keys!709) (size!13541 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444823 () Bool)

(declare-fun res!263907 () Bool)

(assert (=> b!444823 (=> (not res!263907) (not e!261500))))

(declare-fun arrayContainsKey!0 (array!27479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444823 (= res!263907 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!263910 () Bool)

(assert (=> start!40434 (=> (not res!263910) (not e!261500))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40434 (= res!263910 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13540 _keys!709))))))

(assert (=> start!40434 e!261500))

(assert (=> start!40434 true))

(declare-fun array_inv!9614 (array!27481) Bool)

(assert (=> start!40434 (and (array_inv!9614 _values!549) e!261497)))

(declare-fun array_inv!9615 (array!27479) Bool)

(assert (=> start!40434 (array_inv!9615 _keys!709)))

(declare-fun b!444814 () Bool)

(declare-fun res!263909 () Bool)

(assert (=> b!444814 (=> (not res!263909) (not e!261500))))

(assert (=> b!444814 (= res!263909 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13540 _keys!709))))))

(assert (= (and start!40434 res!263910) b!444819))

(assert (= (and b!444819 res!263905) b!444822))

(assert (= (and b!444822 res!263908) b!444811))

(assert (= (and b!444811 res!263902) b!444813))

(assert (= (and b!444813 res!263904) b!444814))

(assert (= (and b!444814 res!263909) b!444818))

(assert (= (and b!444818 res!263903) b!444821))

(assert (= (and b!444821 res!263911) b!444823))

(assert (= (and b!444823 res!263907) b!444817))

(assert (= (and b!444817 res!263906) b!444812))

(assert (= (and b!444815 condMapEmpty!19377) mapIsEmpty!19377))

(assert (= (and b!444815 (not condMapEmpty!19377)) mapNonEmpty!19377))

(get-info :version)

(assert (= (and mapNonEmpty!19377 ((_ is ValueCellFull!5573) mapValue!19377)) b!444820))

(assert (= (and b!444815 ((_ is ValueCellFull!5573) mapDefault!19377)) b!444816))

(assert (= start!40434 b!444815))

(declare-fun m!429985 () Bool)

(assert (=> b!444813 m!429985))

(declare-fun m!429987 () Bool)

(assert (=> b!444823 m!429987))

(declare-fun m!429989 () Bool)

(assert (=> b!444821 m!429989))

(declare-fun m!429991 () Bool)

(assert (=> b!444818 m!429991))

(declare-fun m!429993 () Bool)

(assert (=> b!444812 m!429993))

(declare-fun m!429995 () Bool)

(assert (=> b!444819 m!429995))

(declare-fun m!429997 () Bool)

(assert (=> mapNonEmpty!19377 m!429997))

(declare-fun m!429999 () Bool)

(assert (=> start!40434 m!429999))

(declare-fun m!430001 () Bool)

(assert (=> start!40434 m!430001))

(declare-fun m!430003 () Bool)

(assert (=> b!444817 m!430003))

(declare-fun m!430005 () Bool)

(assert (=> b!444817 m!430005))

(declare-fun m!430007 () Bool)

(assert (=> b!444811 m!430007))

(check-sat (not b!444818) (not b!444817) (not mapNonEmpty!19377) (not b!444812) (not b!444813) (not start!40434) (not b!444819) (not b!444823) (not b!444811) tp_is_empty!11833)
(check-sat)
