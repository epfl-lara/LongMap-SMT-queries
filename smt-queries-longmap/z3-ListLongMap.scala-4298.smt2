; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59818 () Bool)

(assert start!59818)

(declare-fun b!660922 () Bool)

(declare-fun e!379761 () Bool)

(declare-datatypes ((List!12666 0))(
  ( (Nil!12663) (Cons!12662 (h!13707 (_ BitVec 64)) (t!18894 List!12666)) )
))
(declare-fun acc!681 () List!12666)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3243 (List!12666 (_ BitVec 64)) Bool)

(assert (=> b!660922 (= e!379761 (not (contains!3243 acc!681 k0!2843)))))

(declare-fun b!660924 () Bool)

(declare-fun res!428992 () Bool)

(declare-fun e!379757 () Bool)

(assert (=> b!660924 (=> (not res!428992) (not e!379757))))

(declare-datatypes ((array!38865 0))(
  ( (array!38866 (arr!18625 (Array (_ BitVec 32) (_ BitVec 64))) (size!18989 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38865)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38865 (_ BitVec 32) List!12666) Bool)

(assert (=> b!660924 (= res!428992 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660925 () Bool)

(declare-fun res!428995 () Bool)

(assert (=> b!660925 (=> (not res!428995) (not e!379757))))

(declare-fun noDuplicate!490 (List!12666) Bool)

(assert (=> b!660925 (= res!428995 (noDuplicate!490 acc!681))))

(declare-fun b!660926 () Bool)

(declare-fun res!428989 () Bool)

(assert (=> b!660926 (=> (not res!428989) (not e!379757))))

(declare-fun e!379758 () Bool)

(assert (=> b!660926 (= res!428989 e!379758)))

(declare-fun res!428993 () Bool)

(assert (=> b!660926 (=> res!428993 e!379758)))

(declare-fun e!379760 () Bool)

(assert (=> b!660926 (= res!428993 e!379760)))

(declare-fun res!428990 () Bool)

(assert (=> b!660926 (=> (not res!428990) (not e!379760))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660926 (= res!428990 (bvsgt from!3004 i!1382))))

(declare-fun b!660927 () Bool)

(declare-fun res!428996 () Bool)

(assert (=> b!660927 (=> (not res!428996) (not e!379757))))

(assert (=> b!660927 (= res!428996 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12663))))

(declare-fun b!660928 () Bool)

(declare-fun res!428987 () Bool)

(assert (=> b!660928 (=> (not res!428987) (not e!379757))))

(assert (=> b!660928 (= res!428987 (not (contains!3243 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660929 () Bool)

(declare-fun res!428997 () Bool)

(assert (=> b!660929 (=> (not res!428997) (not e!379757))))

(assert (=> b!660929 (= res!428997 (not (contains!3243 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660930 () Bool)

(assert (=> b!660930 (= e!379758 e!379761)))

(declare-fun res!428994 () Bool)

(assert (=> b!660930 (=> (not res!428994) (not e!379761))))

(assert (=> b!660930 (= res!428994 (bvsle from!3004 i!1382))))

(declare-fun res!428986 () Bool)

(assert (=> start!59818 (=> (not res!428986) (not e!379757))))

(assert (=> start!59818 (= res!428986 (and (bvslt (size!18989 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18989 a!3626))))))

(assert (=> start!59818 e!379757))

(assert (=> start!59818 true))

(declare-fun array_inv!14421 (array!38865) Bool)

(assert (=> start!59818 (array_inv!14421 a!3626)))

(declare-fun b!660923 () Bool)

(declare-fun res!428988 () Bool)

(assert (=> b!660923 (=> (not res!428988) (not e!379757))))

(assert (=> b!660923 (= res!428988 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18989 a!3626))))))

(declare-fun b!660931 () Bool)

(declare-fun res!428999 () Bool)

(assert (=> b!660931 (=> (not res!428999) (not e!379757))))

(assert (=> b!660931 (= res!428999 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18989 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!660932 () Bool)

(declare-fun res!428991 () Bool)

(assert (=> b!660932 (=> (not res!428991) (not e!379757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660932 (= res!428991 (validKeyInArray!0 k0!2843))))

(declare-fun b!660933 () Bool)

(assert (=> b!660933 (= e!379760 (contains!3243 acc!681 k0!2843))))

(declare-fun b!660934 () Bool)

(declare-fun res!428998 () Bool)

(assert (=> b!660934 (=> (not res!428998) (not e!379757))))

(declare-fun arrayContainsKey!0 (array!38865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660934 (= res!428998 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660935 () Bool)

(assert (=> b!660935 (= e!379757 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(assert (=> b!660935 (arrayContainsKey!0 (array!38866 (store (arr!18625 a!3626) i!1382 k0!2843) (size!18989 a!3626)) k0!2843 from!3004)))

(assert (= (and start!59818 res!428986) b!660925))

(assert (= (and b!660925 res!428995) b!660929))

(assert (= (and b!660929 res!428997) b!660928))

(assert (= (and b!660928 res!428987) b!660926))

(assert (= (and b!660926 res!428990) b!660933))

(assert (= (and b!660926 (not res!428993)) b!660930))

(assert (= (and b!660930 res!428994) b!660922))

(assert (= (and b!660926 res!428989) b!660927))

(assert (= (and b!660927 res!428996) b!660924))

(assert (= (and b!660924 res!428992) b!660923))

(assert (= (and b!660923 res!428988) b!660932))

(assert (= (and b!660932 res!428991) b!660934))

(assert (= (and b!660934 res!428998) b!660931))

(assert (= (and b!660931 res!428999) b!660935))

(declare-fun m!633357 () Bool)

(assert (=> b!660922 m!633357))

(declare-fun m!633359 () Bool)

(assert (=> b!660935 m!633359))

(declare-fun m!633361 () Bool)

(assert (=> b!660935 m!633361))

(declare-fun m!633363 () Bool)

(assert (=> b!660928 m!633363))

(declare-fun m!633365 () Bool)

(assert (=> start!59818 m!633365))

(declare-fun m!633367 () Bool)

(assert (=> b!660929 m!633367))

(declare-fun m!633369 () Bool)

(assert (=> b!660924 m!633369))

(declare-fun m!633371 () Bool)

(assert (=> b!660927 m!633371))

(declare-fun m!633373 () Bool)

(assert (=> b!660932 m!633373))

(declare-fun m!633375 () Bool)

(assert (=> b!660934 m!633375))

(assert (=> b!660933 m!633357))

(declare-fun m!633377 () Bool)

(assert (=> b!660925 m!633377))

(check-sat (not start!59818) (not b!660932) (not b!660929) (not b!660924) (not b!660925) (not b!660927) (not b!660922) (not b!660935) (not b!660928) (not b!660933) (not b!660934))
(check-sat)
