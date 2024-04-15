; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38462 () Bool)

(assert start!38462)

(declare-fun b!396907 () Bool)

(declare-fun res!227880 () Bool)

(declare-fun e!240061 () Bool)

(assert (=> b!396907 (=> (not res!227880) (not e!240061))))

(declare-datatypes ((array!23685 0))(
  ( (array!23686 (arr!11292 (Array (_ BitVec 32) (_ BitVec 64))) (size!11645 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23685)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23685 (_ BitVec 32)) Bool)

(assert (=> b!396907 (= res!227880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396908 () Bool)

(declare-fun res!227872 () Bool)

(assert (=> b!396908 (=> (not res!227872) (not e!240061))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396908 (= res!227872 (or (= (select (arr!11292 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11292 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396909 () Bool)

(declare-fun res!227879 () Bool)

(assert (=> b!396909 (=> (not res!227879) (not e!240061))))

(assert (=> b!396909 (= res!227879 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11645 _keys!709))))))

(declare-fun b!396910 () Bool)

(declare-fun res!227877 () Bool)

(assert (=> b!396910 (=> (not res!227877) (not e!240061))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14299 0))(
  ( (V!14300 (val!4992 Int)) )
))
(declare-datatypes ((ValueCell!4604 0))(
  ( (ValueCellFull!4604 (v!7233 V!14299)) (EmptyCell!4604) )
))
(declare-datatypes ((array!23687 0))(
  ( (array!23688 (arr!11293 (Array (_ BitVec 32) ValueCell!4604)) (size!11646 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23687)

(assert (=> b!396910 (= res!227877 (and (= (size!11646 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11645 _keys!709) (size!11646 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396911 () Bool)

(declare-fun e!240065 () Bool)

(declare-fun e!240066 () Bool)

(declare-fun mapRes!16464 () Bool)

(assert (=> b!396911 (= e!240065 (and e!240066 mapRes!16464))))

(declare-fun condMapEmpty!16464 () Bool)

(declare-fun mapDefault!16464 () ValueCell!4604)

(assert (=> b!396911 (= condMapEmpty!16464 (= (arr!11293 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4604)) mapDefault!16464)))))

(declare-fun b!396912 () Bool)

(declare-fun res!227873 () Bool)

(assert (=> b!396912 (=> (not res!227873) (not e!240061))))

(declare-datatypes ((List!6503 0))(
  ( (Nil!6500) (Cons!6499 (h!7355 (_ BitVec 64)) (t!11668 List!6503)) )
))
(declare-fun arrayNoDuplicates!0 (array!23685 (_ BitVec 32) List!6503) Bool)

(assert (=> b!396912 (= res!227873 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6500))))

(declare-fun b!396913 () Bool)

(declare-fun e!240063 () Bool)

(assert (=> b!396913 (= e!240063 false)))

(declare-fun lt!187031 () Bool)

(declare-fun lt!187030 () array!23685)

(assert (=> b!396913 (= lt!187031 (arrayNoDuplicates!0 lt!187030 #b00000000000000000000000000000000 Nil!6500))))

(declare-fun b!396914 () Bool)

(declare-fun res!227871 () Bool)

(assert (=> b!396914 (=> (not res!227871) (not e!240061))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396914 (= res!227871 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396915 () Bool)

(declare-fun e!240064 () Bool)

(declare-fun tp_is_empty!9895 () Bool)

(assert (=> b!396915 (= e!240064 tp_is_empty!9895)))

(declare-fun mapIsEmpty!16464 () Bool)

(assert (=> mapIsEmpty!16464 mapRes!16464))

(declare-fun b!396916 () Bool)

(declare-fun res!227875 () Bool)

(assert (=> b!396916 (=> (not res!227875) (not e!240061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396916 (= res!227875 (validMask!0 mask!1025))))

(declare-fun b!396917 () Bool)

(declare-fun res!227876 () Bool)

(assert (=> b!396917 (=> (not res!227876) (not e!240061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396917 (= res!227876 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16464 () Bool)

(declare-fun tp!32259 () Bool)

(assert (=> mapNonEmpty!16464 (= mapRes!16464 (and tp!32259 e!240064))))

(declare-fun mapRest!16464 () (Array (_ BitVec 32) ValueCell!4604))

(declare-fun mapKey!16464 () (_ BitVec 32))

(declare-fun mapValue!16464 () ValueCell!4604)

(assert (=> mapNonEmpty!16464 (= (arr!11293 _values!549) (store mapRest!16464 mapKey!16464 mapValue!16464))))

(declare-fun res!227874 () Bool)

(assert (=> start!38462 (=> (not res!227874) (not e!240061))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38462 (= res!227874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11645 _keys!709))))))

(assert (=> start!38462 e!240061))

(assert (=> start!38462 true))

(declare-fun array_inv!8292 (array!23687) Bool)

(assert (=> start!38462 (and (array_inv!8292 _values!549) e!240065)))

(declare-fun array_inv!8293 (array!23685) Bool)

(assert (=> start!38462 (array_inv!8293 _keys!709)))

(declare-fun b!396918 () Bool)

(assert (=> b!396918 (= e!240066 tp_is_empty!9895)))

(declare-fun b!396919 () Bool)

(assert (=> b!396919 (= e!240061 e!240063)))

(declare-fun res!227878 () Bool)

(assert (=> b!396919 (=> (not res!227878) (not e!240063))))

(assert (=> b!396919 (= res!227878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187030 mask!1025))))

(assert (=> b!396919 (= lt!187030 (array!23686 (store (arr!11292 _keys!709) i!563 k0!794) (size!11645 _keys!709)))))

(assert (= (and start!38462 res!227874) b!396916))

(assert (= (and b!396916 res!227875) b!396910))

(assert (= (and b!396910 res!227877) b!396907))

(assert (= (and b!396907 res!227880) b!396912))

(assert (= (and b!396912 res!227873) b!396909))

(assert (= (and b!396909 res!227879) b!396917))

(assert (= (and b!396917 res!227876) b!396908))

(assert (= (and b!396908 res!227872) b!396914))

(assert (= (and b!396914 res!227871) b!396919))

(assert (= (and b!396919 res!227878) b!396913))

(assert (= (and b!396911 condMapEmpty!16464) mapIsEmpty!16464))

(assert (= (and b!396911 (not condMapEmpty!16464)) mapNonEmpty!16464))

(get-info :version)

(assert (= (and mapNonEmpty!16464 ((_ is ValueCellFull!4604) mapValue!16464)) b!396915))

(assert (= (and b!396911 ((_ is ValueCellFull!4604) mapDefault!16464)) b!396918))

(assert (= start!38462 b!396911))

(declare-fun m!391803 () Bool)

(assert (=> b!396914 m!391803))

(declare-fun m!391805 () Bool)

(assert (=> b!396912 m!391805))

(declare-fun m!391807 () Bool)

(assert (=> b!396908 m!391807))

(declare-fun m!391809 () Bool)

(assert (=> b!396907 m!391809))

(declare-fun m!391811 () Bool)

(assert (=> b!396916 m!391811))

(declare-fun m!391813 () Bool)

(assert (=> b!396913 m!391813))

(declare-fun m!391815 () Bool)

(assert (=> start!38462 m!391815))

(declare-fun m!391817 () Bool)

(assert (=> start!38462 m!391817))

(declare-fun m!391819 () Bool)

(assert (=> mapNonEmpty!16464 m!391819))

(declare-fun m!391821 () Bool)

(assert (=> b!396919 m!391821))

(declare-fun m!391823 () Bool)

(assert (=> b!396919 m!391823))

(declare-fun m!391825 () Bool)

(assert (=> b!396917 m!391825))

(check-sat tp_is_empty!9895 (not b!396919) (not mapNonEmpty!16464) (not b!396916) (not b!396912) (not b!396913) (not b!396917) (not start!38462) (not b!396907) (not b!396914))
(check-sat)
