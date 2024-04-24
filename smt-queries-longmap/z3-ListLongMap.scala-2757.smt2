; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40380 () Bool)

(assert start!40380)

(declare-fun b!443980 () Bool)

(declare-fun res!263227 () Bool)

(declare-fun e!261156 () Bool)

(assert (=> b!443980 (=> (not res!263227) (not e!261156))))

(declare-datatypes ((array!27372 0))(
  ( (array!27373 (arr!13133 (Array (_ BitVec 32) (_ BitVec 64))) (size!13485 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27372)

(declare-datatypes ((List!7775 0))(
  ( (Nil!7772) (Cons!7771 (h!8627 (_ BitVec 64)) (t!13525 List!7775)) )
))
(declare-fun arrayNoDuplicates!0 (array!27372 (_ BitVec 32) List!7775) Bool)

(assert (=> b!443980 (= res!263227 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7772))))

(declare-fun res!263221 () Bool)

(assert (=> start!40380 (=> (not res!263221) (not e!261156))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40380 (= res!263221 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13485 _keys!709))))))

(assert (=> start!40380 e!261156))

(assert (=> start!40380 true))

(declare-datatypes ((V!16811 0))(
  ( (V!16812 (val!5934 Int)) )
))
(declare-datatypes ((ValueCell!5546 0))(
  ( (ValueCellFull!5546 (v!8186 V!16811)) (EmptyCell!5546) )
))
(declare-datatypes ((array!27374 0))(
  ( (array!27375 (arr!13134 (Array (_ BitVec 32) ValueCell!5546)) (size!13486 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27374)

(declare-fun e!261151 () Bool)

(declare-fun array_inv!9598 (array!27374) Bool)

(assert (=> start!40380 (and (array_inv!9598 _values!549) e!261151)))

(declare-fun array_inv!9599 (array!27372) Bool)

(assert (=> start!40380 (array_inv!9599 _keys!709)))

(declare-fun b!443981 () Bool)

(declare-fun res!263225 () Bool)

(assert (=> b!443981 (=> (not res!263225) (not e!261156))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443981 (= res!263225 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19296 () Bool)

(declare-fun mapRes!19296 () Bool)

(declare-fun tp!37278 () Bool)

(declare-fun e!261153 () Bool)

(assert (=> mapNonEmpty!19296 (= mapRes!19296 (and tp!37278 e!261153))))

(declare-fun mapValue!19296 () ValueCell!5546)

(declare-fun mapRest!19296 () (Array (_ BitVec 32) ValueCell!5546))

(declare-fun mapKey!19296 () (_ BitVec 32))

(assert (=> mapNonEmpty!19296 (= (arr!13134 _values!549) (store mapRest!19296 mapKey!19296 mapValue!19296))))

(declare-fun b!443982 () Bool)

(declare-fun res!263222 () Bool)

(assert (=> b!443982 (=> (not res!263222) (not e!261156))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27372 (_ BitVec 32)) Bool)

(assert (=> b!443982 (= res!263222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443983 () Bool)

(declare-fun res!263226 () Bool)

(assert (=> b!443983 (=> (not res!263226) (not e!261156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443983 (= res!263226 (validMask!0 mask!1025))))

(declare-fun b!443984 () Bool)

(declare-fun res!263218 () Bool)

(assert (=> b!443984 (=> (not res!263218) (not e!261156))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443984 (= res!263218 (or (= (select (arr!13133 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13133 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443985 () Bool)

(declare-fun res!263223 () Bool)

(assert (=> b!443985 (=> (not res!263223) (not e!261156))))

(assert (=> b!443985 (= res!263223 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13485 _keys!709))))))

(declare-fun b!443986 () Bool)

(declare-fun e!261152 () Bool)

(declare-fun tp_is_empty!11779 () Bool)

(assert (=> b!443986 (= e!261152 tp_is_empty!11779)))

(declare-fun mapIsEmpty!19296 () Bool)

(assert (=> mapIsEmpty!19296 mapRes!19296))

(declare-fun b!443987 () Bool)

(declare-fun res!263224 () Bool)

(assert (=> b!443987 (=> (not res!263224) (not e!261156))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443987 (= res!263224 (and (= (size!13486 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13485 _keys!709) (size!13486 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443988 () Bool)

(assert (=> b!443988 (= e!261153 tp_is_empty!11779)))

(declare-fun b!443989 () Bool)

(declare-fun e!261155 () Bool)

(assert (=> b!443989 (= e!261155 false)))

(declare-fun lt!203447 () Bool)

(declare-fun lt!203448 () array!27372)

(assert (=> b!443989 (= lt!203447 (arrayNoDuplicates!0 lt!203448 #b00000000000000000000000000000000 Nil!7772))))

(declare-fun b!443990 () Bool)

(assert (=> b!443990 (= e!261151 (and e!261152 mapRes!19296))))

(declare-fun condMapEmpty!19296 () Bool)

(declare-fun mapDefault!19296 () ValueCell!5546)

(assert (=> b!443990 (= condMapEmpty!19296 (= (arr!13134 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5546)) mapDefault!19296)))))

(declare-fun b!443991 () Bool)

(assert (=> b!443991 (= e!261156 e!261155)))

(declare-fun res!263220 () Bool)

(assert (=> b!443991 (=> (not res!263220) (not e!261155))))

(assert (=> b!443991 (= res!263220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203448 mask!1025))))

(assert (=> b!443991 (= lt!203448 (array!27373 (store (arr!13133 _keys!709) i!563 k0!794) (size!13485 _keys!709)))))

(declare-fun b!443992 () Bool)

(declare-fun res!263219 () Bool)

(assert (=> b!443992 (=> (not res!263219) (not e!261156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443992 (= res!263219 (validKeyInArray!0 k0!794))))

(assert (= (and start!40380 res!263221) b!443983))

(assert (= (and b!443983 res!263226) b!443987))

(assert (= (and b!443987 res!263224) b!443982))

(assert (= (and b!443982 res!263222) b!443980))

(assert (= (and b!443980 res!263227) b!443985))

(assert (= (and b!443985 res!263223) b!443992))

(assert (= (and b!443992 res!263219) b!443984))

(assert (= (and b!443984 res!263218) b!443981))

(assert (= (and b!443981 res!263225) b!443991))

(assert (= (and b!443991 res!263220) b!443989))

(assert (= (and b!443990 condMapEmpty!19296) mapIsEmpty!19296))

(assert (= (and b!443990 (not condMapEmpty!19296)) mapNonEmpty!19296))

(get-info :version)

(assert (= (and mapNonEmpty!19296 ((_ is ValueCellFull!5546) mapValue!19296)) b!443988))

(assert (= (and b!443990 ((_ is ValueCellFull!5546) mapDefault!19296)) b!443986))

(assert (= start!40380 b!443990))

(declare-fun m!430287 () Bool)

(assert (=> b!443991 m!430287))

(declare-fun m!430289 () Bool)

(assert (=> b!443991 m!430289))

(declare-fun m!430291 () Bool)

(assert (=> start!40380 m!430291))

(declare-fun m!430293 () Bool)

(assert (=> start!40380 m!430293))

(declare-fun m!430295 () Bool)

(assert (=> b!443984 m!430295))

(declare-fun m!430297 () Bool)

(assert (=> b!443982 m!430297))

(declare-fun m!430299 () Bool)

(assert (=> b!443992 m!430299))

(declare-fun m!430301 () Bool)

(assert (=> mapNonEmpty!19296 m!430301))

(declare-fun m!430303 () Bool)

(assert (=> b!443989 m!430303))

(declare-fun m!430305 () Bool)

(assert (=> b!443983 m!430305))

(declare-fun m!430307 () Bool)

(assert (=> b!443981 m!430307))

(declare-fun m!430309 () Bool)

(assert (=> b!443980 m!430309))

(check-sat (not b!443983) (not start!40380) (not mapNonEmpty!19296) tp_is_empty!11779 (not b!443991) (not b!443989) (not b!443980) (not b!443992) (not b!443982) (not b!443981))
(check-sat)
