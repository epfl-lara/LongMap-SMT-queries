; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40502 () Bool)

(assert start!40502)

(declare-fun mapNonEmpty!19452 () Bool)

(declare-fun mapRes!19452 () Bool)

(declare-fun tp!37479 () Bool)

(declare-fun e!262206 () Bool)

(assert (=> mapNonEmpty!19452 (= mapRes!19452 (and tp!37479 e!262206))))

(declare-datatypes ((V!16947 0))(
  ( (V!16948 (val!5985 Int)) )
))
(declare-datatypes ((ValueCell!5597 0))(
  ( (ValueCellFull!5597 (v!8241 V!16947)) (EmptyCell!5597) )
))
(declare-datatypes ((array!27574 0))(
  ( (array!27575 (arr!13233 (Array (_ BitVec 32) ValueCell!5597)) (size!13585 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27574)

(declare-fun mapValue!19452 () ValueCell!5597)

(declare-fun mapRest!19452 () (Array (_ BitVec 32) ValueCell!5597))

(declare-fun mapKey!19452 () (_ BitVec 32))

(assert (=> mapNonEmpty!19452 (= (arr!13233 _values!549) (store mapRest!19452 mapKey!19452 mapValue!19452))))

(declare-fun b!446297 () Bool)

(declare-fun e!262209 () Bool)

(declare-fun e!262210 () Bool)

(assert (=> b!446297 (= e!262209 (and e!262210 mapRes!19452))))

(declare-fun condMapEmpty!19452 () Bool)

(declare-fun mapDefault!19452 () ValueCell!5597)

(assert (=> b!446297 (= condMapEmpty!19452 (= (arr!13233 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5597)) mapDefault!19452)))))

(declare-fun b!446298 () Bool)

(declare-fun res!264909 () Bool)

(declare-fun e!262207 () Bool)

(assert (=> b!446298 (=> (not res!264909) (not e!262207))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446298 (= res!264909 (validMask!0 mask!1025))))

(declare-fun b!446299 () Bool)

(declare-fun e!262208 () Bool)

(assert (=> b!446299 (= e!262207 e!262208)))

(declare-fun res!264913 () Bool)

(assert (=> b!446299 (=> (not res!264913) (not e!262208))))

(declare-datatypes ((array!27576 0))(
  ( (array!27577 (arr!13234 (Array (_ BitVec 32) (_ BitVec 64))) (size!13586 (_ BitVec 32))) )
))
(declare-fun lt!203814 () array!27576)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27576 (_ BitVec 32)) Bool)

(assert (=> b!446299 (= res!264913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203814 mask!1025))))

(declare-fun _keys!709 () array!27576)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446299 (= lt!203814 (array!27577 (store (arr!13234 _keys!709) i!563 k0!794) (size!13586 _keys!709)))))

(declare-fun b!446300 () Bool)

(assert (=> b!446300 (= e!262208 false)))

(declare-fun lt!203813 () Bool)

(declare-datatypes ((List!7832 0))(
  ( (Nil!7829) (Cons!7828 (h!8684 (_ BitVec 64)) (t!13584 List!7832)) )
))
(declare-fun arrayNoDuplicates!0 (array!27576 (_ BitVec 32) List!7832) Bool)

(assert (=> b!446300 (= lt!203813 (arrayNoDuplicates!0 lt!203814 #b00000000000000000000000000000000 Nil!7829))))

(declare-fun b!446301 () Bool)

(declare-fun tp_is_empty!11881 () Bool)

(assert (=> b!446301 (= e!262206 tp_is_empty!11881)))

(declare-fun b!446302 () Bool)

(declare-fun res!264914 () Bool)

(assert (=> b!446302 (=> (not res!264914) (not e!262207))))

(declare-fun arrayContainsKey!0 (array!27576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446302 (= res!264914 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446303 () Bool)

(declare-fun res!264911 () Bool)

(assert (=> b!446303 (=> (not res!264911) (not e!262207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446303 (= res!264911 (validKeyInArray!0 k0!794))))

(declare-fun b!446304 () Bool)

(declare-fun res!264915 () Bool)

(assert (=> b!446304 (=> (not res!264915) (not e!262207))))

(assert (=> b!446304 (= res!264915 (or (= (select (arr!13234 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13234 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446305 () Bool)

(declare-fun res!264907 () Bool)

(assert (=> b!446305 (=> (not res!264907) (not e!262207))))

(assert (=> b!446305 (= res!264907 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13586 _keys!709))))))

(declare-fun b!446306 () Bool)

(declare-fun res!264910 () Bool)

(assert (=> b!446306 (=> (not res!264910) (not e!262207))))

(assert (=> b!446306 (= res!264910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446307 () Bool)

(declare-fun res!264906 () Bool)

(assert (=> b!446307 (=> (not res!264906) (not e!262207))))

(assert (=> b!446307 (= res!264906 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7829))))

(declare-fun mapIsEmpty!19452 () Bool)

(assert (=> mapIsEmpty!19452 mapRes!19452))

(declare-fun res!264912 () Bool)

(assert (=> start!40502 (=> (not res!264912) (not e!262207))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40502 (= res!264912 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13586 _keys!709))))))

(assert (=> start!40502 e!262207))

(assert (=> start!40502 true))

(declare-fun array_inv!9676 (array!27574) Bool)

(assert (=> start!40502 (and (array_inv!9676 _values!549) e!262209)))

(declare-fun array_inv!9677 (array!27576) Bool)

(assert (=> start!40502 (array_inv!9677 _keys!709)))

(declare-fun b!446308 () Bool)

(declare-fun res!264908 () Bool)

(assert (=> b!446308 (=> (not res!264908) (not e!262207))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446308 (= res!264908 (and (= (size!13585 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13586 _keys!709) (size!13585 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446309 () Bool)

(assert (=> b!446309 (= e!262210 tp_is_empty!11881)))

(assert (= (and start!40502 res!264912) b!446298))

(assert (= (and b!446298 res!264909) b!446308))

(assert (= (and b!446308 res!264908) b!446306))

(assert (= (and b!446306 res!264910) b!446307))

(assert (= (and b!446307 res!264906) b!446305))

(assert (= (and b!446305 res!264907) b!446303))

(assert (= (and b!446303 res!264911) b!446304))

(assert (= (and b!446304 res!264915) b!446302))

(assert (= (and b!446302 res!264914) b!446299))

(assert (= (and b!446299 res!264913) b!446300))

(assert (= (and b!446297 condMapEmpty!19452) mapIsEmpty!19452))

(assert (= (and b!446297 (not condMapEmpty!19452)) mapNonEmpty!19452))

(get-info :version)

(assert (= (and mapNonEmpty!19452 ((_ is ValueCellFull!5597) mapValue!19452)) b!446301))

(assert (= (and b!446297 ((_ is ValueCellFull!5597) mapDefault!19452)) b!446309))

(assert (= start!40502 b!446297))

(declare-fun m!431843 () Bool)

(assert (=> b!446298 m!431843))

(declare-fun m!431845 () Bool)

(assert (=> b!446303 m!431845))

(declare-fun m!431847 () Bool)

(assert (=> b!446306 m!431847))

(declare-fun m!431849 () Bool)

(assert (=> b!446304 m!431849))

(declare-fun m!431851 () Bool)

(assert (=> mapNonEmpty!19452 m!431851))

(declare-fun m!431853 () Bool)

(assert (=> b!446307 m!431853))

(declare-fun m!431855 () Bool)

(assert (=> b!446299 m!431855))

(declare-fun m!431857 () Bool)

(assert (=> b!446299 m!431857))

(declare-fun m!431859 () Bool)

(assert (=> start!40502 m!431859))

(declare-fun m!431861 () Bool)

(assert (=> start!40502 m!431861))

(declare-fun m!431863 () Bool)

(assert (=> b!446302 m!431863))

(declare-fun m!431865 () Bool)

(assert (=> b!446300 m!431865))

(check-sat (not b!446307) tp_is_empty!11881 (not b!446303) (not b!446299) (not b!446306) (not b!446300) (not b!446302) (not start!40502) (not b!446298) (not mapNonEmpty!19452))
(check-sat)
